require "rails_helper"

RSpec.describe VisualizationMailer, type: :mailer do
  describe "Notify visualization" do
    it "Dados do email" do
      user = create(:user, email: "wilma@hotmail.com")
      photo = create(:photo, user: user)
      visualization = create(:visualization, photo: photo)

      notify = VisualizationMailer.with(photo: photo).notify_visualization.deliver_now

      expect(notify.subject).to eq("Sua foto atingiu #{photo.visualizations.count} visualizações.")
      expect(notify.to).to eq([photo.user.email])
      expect(notify.from).to eq(['wilminhasilva@gmail.com'])
    end
  end
end
