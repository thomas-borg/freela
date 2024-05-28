import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper/bundle";

export default class Carousel extends Controller {
  swiper;
  optionsValue;

  static values = {
    options: Object,
  };

  connect() {
    this.swiper = new Swiper(this.element, {
      ...this.defaultOptions,
      ...this.optionsValue,
    });
  }

  disconnect() {
    this.swiper.destroy();
    this.swiper = undefined;
  }

  get defaultOptions() {
    return {};
  }
}
