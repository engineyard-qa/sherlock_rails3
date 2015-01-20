class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    @output = Transaction.find(flash[:transaction_id]).output if flash[:transaction_id]

    @running_processes = Hash.new()

    Dir.chdir(File.join(%w(/ var run engineyard dj) + [@app_name])) do
      Dir.glob('dj_*.pid').each do |f|
        name = f.match(/^dj_(.*)\.pid$/)[1]
        if name
          pid = File.read(f).chomp
          cmdline = `cat /proc/#{pid}/cmdline` rescue nil
          if cmdline 
            #cmdline uses NUL chars to separate command line arguments
            cmdline = cmdline.gsub("\x00",' ') 
            if cmdline =~ /Delayed::/
              max_priority = cmdline.match(/--max.*?priority=([^']*)/)[0] rescue nil
              min_priority = cmdline.match(/--min.*?priority=([^']*)/)[0] rescue nil
              msg = [max_priority,min_priority].compact.join(' ')
              @running_processes[name] = {
                :pid => pid,
                :msg => msg
              }
            else
              @running_processes[name] = {
                :pid => pid,
                :msg => "unexpected process: #{cmdline})"
              }
            end
          else
            @running_processes[name] = {
              :pid => pid,
              :msg => "defunct"
            }
          end
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def start_proc
    args = params[:args]
    vars = params[:vars]

    # Determine app name for production or dev environments
    cmd = "#{vars} /engineyard/bin/dj #{@app_name} start #{args}"
    transaction = Transaction.create!(:command => cmd, :output => `#{cmd}`)
    redirect_to tasks_url, :flash => {:transaction_id => transaction.id}
  end

  def stop_proc
  end
end
