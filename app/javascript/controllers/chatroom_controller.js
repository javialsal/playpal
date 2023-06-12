import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, user_id: Number }
  static targets = ["messages"]

  connect() {
    this._scrollToBottom()
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this._receivedMessage(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  _receivedMessage(data) {
    this.messagesTarget.insertAdjacentHTML('beforeend', data)
    this._scrollToBottom()
  }

  _scrollToBottom() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }
}
