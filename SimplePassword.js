function SimplePassword(str) {
  let capitalLetter = /[A-Z]/g.test(str);
  let number = /[0-9]/g.test(str);
  let ponctuationMark = /[\s~`!@#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?()\._]/g.test(str);
  let substringPassword = !/password/gi.test(str);
  let strLength = str.length > 7 && str.length < 31;

  return capitalLetter && number && ponctuationMark && substringPassword && strLength;
}

SimplePassword("turkey90AAA=")