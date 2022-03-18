require "rails_helper"

RSpec.describe VisualizationMailer, type: :mailer do
  describe "Notify visualization" do
    it "100 visualizações" do
      user = create(:user, email: "wilma@hotmail.com")
      photo = create(:photo, user: user)
      visualization = create(:visualization, photo: photo)

      notify_100 = VisualizationMailer.with(photo: photo).notify_visualization.deliver_now

      expect(notify_100.subject).to eq("Sua foto atingiu #{photo.visualizations.count} visualizações.")
      expect(notify_100.to).to eq([photo.user.email])
      expect(notify_100.from).to eq(['wilminhasilva@gmail.com'])
    end
  end
end
