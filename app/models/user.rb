class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :bookmarks

   # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ユーザーのアカウントが有効であることを確認
  def active_for_authentication?
  	super && !deleted_at
  end

  # 削除したユーザーにカスタムメッセージを追加します
  def inactive_message
  	!deleted_at ? super : :deleted_account
  end
end
