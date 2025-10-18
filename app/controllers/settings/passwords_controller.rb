class Settings::PasswordsController < Settings::BaseController
  # allow_unauthenticated_access
  rate_limit to: 10, within: 3.minutes, only: :update, with: -> { redirect_to new_password_path, alert: "Try again later." }

  def show
  end

  def update
    if Current.user.update(password_params)
      redirect_to settings_profile_path, status: :see_other, notice: "Your password has been updated."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.expect(user: [ :password, :password_confirmation, :password_challenge ]).with_defaults(password_challenge: "")
  end
end
