class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /habits
  # GET /habits.json
  def index
    @habits = current_user.habits
    @hash = Hash.new
    @habits.each do |habit|
      @hash[habit.position] = habit.symbol
    end
  end

  # GET /habits/1
  # GET /habits/1.json
  def show
  end

  # GET /habits/new
  def new
    @habit = Habit.new
  end

  # GET /habits/1/edit
  def edit
  end

  def all_habits
    @habits = current_user.habits
  end

  # POST /habits
  # POST /habits.json
  def create
    @habit = Habit.new(habit_params)
    @habit.user_id = current_user.id
    respond_to do |format|
      if @habit.save
        format.html { redirect_to @habit, notice: "Habit was successfully created." }
        format.json { render :show, status: :created, location: @habit }
      else
        format.html { render :new }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habits/1
  # PATCH/PUT /habits/1.json
  def update
    respond_to do |format|
      if @habit.update(habit_params)
        format.html { redirect_to @habit, notice: "Habit was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /habits/1
  # DELETE /habits/1.json
  def destroy
    @habit.destroy
    respond_to do |format|
      format.html { redirect_to habits_url, notice: "Habit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_habit
    @habit = Habit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def habit_params
    params.require(:habit).permit(:name, :position, :symbol, :user_id)
  end
end
