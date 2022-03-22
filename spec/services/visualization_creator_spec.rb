require 'rails_helper'

RSpec.describe VisualizationCreator, type: :services do
  describe "Notify visualization" do
    context "quando a foto atingir 100 visualizações" do
      it "deve enviar email de notificação" do
        user = create(:user, email: "wilma@hotmail.com")
        photo = create(:photo, user: user)
        create_list(:visualization, 99, photo: photo)

        service = VisualizationCreator.new(photo).call

        expect(service.visualizations.count).to eq(100)
        expect(service.id).to eq(photo.id)
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end
    end
    context "quando a foto atingir 200 visualizações" do
      it "deve enviar email de notificação" do
        user = create(:user, email: "wilma@hotmail.com")
        photo = create(:photo, user: user)
        create_list(:visualization, 199, photo: photo)

        service = VisualizationCreator.new(photo).call

        expect(service.visualizations.count).to eq(200)
        expect(service.id).to eq(photo.id)
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end
    end
  end
end