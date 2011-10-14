class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
  before_filter :authenticate_user!, :except => ["show"]
  before_filter :check_profile
#  before_filter :check_permissions, :only => [:edit,:new, :create,:destroy]

  def index
    unless params[:e_id].blank?
      @tickets = Ticket.all(:conditions => ["event_id = ?",params[:e_id]])
      if @tickets.blank?
        flash[:notice] = "No Tickets available for this Event!"
        redirect_to :controller => "events", :action => "index"
      else
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @tickets }
        end
      end
    else
      flash[:notice] = "Please choose an event first!"
      redirect_to :controller => "events", :action => "index"
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    session[:eve_id] = params[:e_id]
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    params[:ticket][:event_id] = session[:eve_id]
    params[:ticket][:user_id] = current_user.id
    event = Event.find(session[:eve_id])
    unless event.blank?
      i = 0
      err = false
      while i < event.number_of_tickets.to_i  do
        @ticket = Ticket.new(params[:ticket])
        i +=1;
        unless @ticket.save
          err = true
        end
      end

      respond_to do |format|
        if err == false
          format.html { redirect_to(@ticket, :notice => 'Ticket was successfully created.') }
          format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Tickets can't be generated for the event. Please try again or later."
      redirect_to :controller => "events", :action => "index"
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@ticket, :notice => 'Ticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
end
