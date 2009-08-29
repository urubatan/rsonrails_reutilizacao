class TimeLogsController < ApplicationController
  before_filter :setup_variables
  # GET /time_logs/new
  # GET /time_logs/new.xml
  def new
    @time_log = TimeLog.new
    @time_log.user = @current_user
    @time_log.task_date = Date.today
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_log }
      format.js do
          setup_variables
          render(:update) do |page| 
            page.replace_html("tlform", :partial => "form", :locals => {:button_label => "Registrar", :title => "Novo registro de tempo trabalhado"}) 
            page.replace_html("tltable", :partial => "past_tasks")
          end
        end
    end
  end

  # GET /time_logs/1/edit
  def edit
    @time_log = TimeLog.find(params[:id])
    params[:project_id] = @time_log.task_type.project.id
    respond_to do |format|
      format.html
      format.js do
        @task_types = TaskType.find_all_by_project_id params[:project_id]
        render(:update) { |page| page.replace_html("tlform", :partial => "form", :locals => {:button_label => "Registrar", :title => "Novo registro de tempo trabalhado"}) }
      end
    end
  end

  # POST /time_logs
  # POST /time_logs.xml
  def create
    @time_log = TimeLog.new(params[:time_log])

    respond_to do |format|
      if @time_log.save
        flash[:notice] = 'Registro de trabalho criado com sucesso.'
        format.html { redirect_to(:action => "new", :project_id => @time_log.task_type.project.id) }
        format.xml  { render :xml => @time_log, :status => :created, :location => @time_log }
        format.js do
          new
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_log.errors, :status => :unprocessable_entity }
        format.js do
          render(:update) { |page| page.replace_html("tlform", :partial => "form", :locals => {:button_label => "Registrar", :title => "Novo registro de tempo trabalhado"}) }
        end
      end
    end
  end

  # PUT /time_logs/1
  # PUT /time_logs/1.xml
  def update
    @time_log = TimeLog.find(params[:id])

    respond_to do |format|
      if @time_log.update_attributes(params[:time_log])
        flash[:notice] = 'Registro de tempo atualizado com sucesso.'
        format.html { redirect_to(:action => "new", :project_id => @time_log.task_type.project.id) }
        format.xml  { head :ok }
        format.js do
          new
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_log.errors, :status => :unprocessable_entity }
        format.js do
          render(:update) { |page| page.replace_html("tlform", :partial => "form", :locals => {:button_label => "Atualizar", :title => "Editando registro de tempo trabalhado"}) }
        end
      end
    end
  end

  # DELETE /time_logs/1
  # DELETE /time_logs/1.xml
  def destroy
    @time_log = TimeLog.find(params[:id])
    @time_log.destroy
    flash[:notice] = "Registro removido com sucessu"
    respond_to do |format|
      format.html { redirect_to(:action => "new") }
      format.xml  { head :ok }
      format.js do
        setup_variables
        @time_log = TimeLog.new
        @time_log.user = @current_user
        @time_log.task_date = Date.today
      end
    end
  end

  private
  @@rows_per_page = 10
  def setup_variables
    @page_number = (params[:page_number] || 1) 
    @time_logs = TimeLog.find :all, :conditions => {:user_id => @current_user.id}, :order => " task_date desc", :limit => @@rows_per_page, :offset => (@page_number-1) * @@rows_per_page
    @number_of_pages = (TimeLog.count(:conditions => {:user_id => @current_user.id}) / @@rows_per_page) + 1
    @projects = @current_user.projects
    @task_types  = params[:project_id] ? TaskType.find_all_by_project_id(params[:project_id]) : []
  end
end
