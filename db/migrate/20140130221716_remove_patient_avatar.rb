class RemovePatientAvatar < ActiveRecord::Migration
  def change
  	 remove_attachment :patients, :avatar
  end
end
