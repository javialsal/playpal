import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, user_id: Number }
  static targets = ["messages", "form", "button", "input"]

  connect() {
    this._scrollToBottom()
    this.formAction = this.formTarget.action
    this.formTarget.action = ""
    this.disableSubmit()
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this._receivedMessage(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  validate() {
    if (this.inputTarget.value === "") {
      this.disableSubmit()
      this.formTarget.action = ""
    } else {
      this.enableSubmit()
      this.formTarget.action = this.formAction
    }
  }

  enableSubmit() {
    this.buttonTarget.disabled = false
  }

  disableSubmit() {
    this.buttonTarget.disabled = true
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
