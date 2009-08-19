class UserProjectsController < ApplicationController
  # GET /user_projects
  # GET /user_projects.xml
  def index
    @user_projects = UserProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_projects }
    end
  end

  # GET /user_projects/1
  # GET /user_projects/1.xml
  def show
    @user_project = UserProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_project }
    end
  end

  # GET /user_projects/new
  # GET /user_projects/new.xml
  def new
    @user_project = UserProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_project }
    end
  end

  # GET /user_projects/1/edit
  def edit
    @user_project = UserProject.find(params[:id])
  end

  # POST /user_projects
  # POST /user_projects.xml
  def create
    @user_project = UserProject.new(params[:user_project])

    respond_to do |format|
      if @user_project.save
        flash[:notice] = 'UserProject was successfully created.'
        format.html { redirect_to(@user_project) }
        format.xml  { render :xml => @user_project, :status => :created, :location => @user_project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_projects/1
  # PUT /user_projects/1.xml
  def update
    @user_project = UserProject.find(params[:id])

    respond_to do |format|
      if @user_project.update_attributes(params[:user_project])
        flash[:notice] = 'UserProject was successfully updated.'
        format.html { redirect_to(@user_project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_projects/1
  # DELETE /user_projects/1.xml
  def destroy
    @user_project = UserProject.find(params[:id])
    @user_project.destroy

    respond_to do |format|
      format.html { redirect_to(user_projects_url) }
      format.xml  { head :ok }
    end
  end
end
