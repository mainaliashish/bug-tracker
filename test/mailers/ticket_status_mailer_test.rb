require "test_helper"

class TicketStatusMailerTest < ActionMailer::TestCase
  test "send_bug_status" do
    mail = TicketStatusMailer.send_bug_status
    assert_equal "Send bug status", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
