import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit() {
    // この要素（checkbox）を含む form を送信
    const form = this.element.closest("form")
    if (form) form.requestSubmit()
  }
}
