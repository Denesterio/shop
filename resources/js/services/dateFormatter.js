export default class DateFormatter {
  constructor(dateString) {
    this.dateString = dateString;
  }

  getDate() {
    return this.dateString
      .split('T')[0]
      .split('-')
      .reverse()
      .join('.');
  }

  getTime() {
    return this.dateString.split('T')[1].split('.')[0];
  }

  getFullTime(joiner = ' ') {
    return this.getDate() + joiner + this.getTime();
  }
}
