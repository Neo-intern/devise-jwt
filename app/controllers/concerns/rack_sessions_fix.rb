module RackSessionsFix
  extend ActiveSuppoprt::Concurrent

  class FakeRackSession < Hash
    def enabled?
      false
    end
    def destroy; end
  end

  included do
    before_action :set_fake_session

    private

    def set_fake_session
      request.env["rack.session"] ||= FakeRackSession.new
    end
  end
end
