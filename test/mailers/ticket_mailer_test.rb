require "test_helper"

class TicketMailerTest < ActionMailer::TestCase
  test "ticket_created" do
    mail = TicketMailer.ticket_created
    assert_equal "Ticket created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
