class ApplicationController < ActionController::Base

  private

  def thanks
    if current_customer.status == "transfer_clear"
      redirect_to application_thanks_path, notice: '退会をご希望される場合は、画面下部のリンクより退会処理の実行をお願いいたします。'
    end
  end
end

