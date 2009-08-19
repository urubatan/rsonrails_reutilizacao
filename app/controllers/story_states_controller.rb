class StoryStatesController < ApplicationController
  # GET /story_states
  # GET /story_states.xml
  def index
    @story_states = StoryState.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @story_states }
    end
  end

  # GET /story_states/1
  # GET /story_states/1.xml
  def show
    @story_state = StoryState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story_state }
    end
  end

  # GET /story_states/new
  # GET /story_states/new.xml
  def new
    @story_state = StoryState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story_state }
    end
  end

  # GET /story_states/1/edit
  def edit
    @story_state = StoryState.find(params[:id])
  end

  # POST /story_states
  # POST /story_states.xml
  def create
    @story_state = StoryState.new(params[:story_state])

    respond_to do |format|
      if @story_state.save
        flash[:notice] = 'StoryState was successfully created.'
        format.html { redirect_to(@story_state) }
        format.xml  { render :xml => @story_state, :status => :created, :location => @story_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /story_states/1
  # PUT /story_states/1.xml
  def update
    @story_state = StoryState.find(params[:id])

    respond_to do |format|
      if @story_state.update_attributes(params[:story_state])
        flash[:notice] = 'StoryState was successfully updated.'
        format.html { redirect_to(@story_state) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /story_states/1
  # DELETE /story_states/1.xml
  def destroy
    @story_state = StoryState.find(params[:id])
    @story_state.destroy

    respond_to do |format|
      format.html { redirect_to(story_states_url) }
      format.xml  { head :ok }
    end
  end
end
