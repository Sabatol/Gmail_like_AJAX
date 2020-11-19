class EmailsController < ApplicationController

require 'faker'

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.update(object: @email.object, body: @email.body, read: true)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def new
  end

  def create
    @email = Email.new(object: Faker::Esport.event,body: Faker::Book.title)
    if @email.save
      respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
      end
    else
      alert("Essaye encore !")
    end
  end

  def edit
  end

  def update
    @email = Email.find(params[:id])
    if @email.read
      @email.update(object: @email.object, body: @email.body, read: false)
    else
      @email.update(object: @email.object, body: @email.body, read: true)
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end
