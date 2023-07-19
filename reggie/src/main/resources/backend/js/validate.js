
function isValidUsername (str) {
  return ['admin', 'editor'].indexOf(str.trim()) >= 0;
}

function isExternal (path) {
  return /^(https?:|mailto:|tel:)/.test(path);
}

function isCellPhone (val) {
  if (!/^09\d{8}$/.test(val)) {
    return false
  } else {
    return true
  }
}

//校验账号
function checkUserName (rule, value, callback){
  if (value == "") {
    callback(new Error("請輸入帳號"))
  } else if (value.length > 20 || value.length <3) {
    callback(new Error("帳號長度應是3-20"))
  } else {
    callback()
  }
}

//校验姓名
function checkName (rule, value, callback){
  if (value == "") {
    callback(new Error("請輸入姓名"))
  } else if (value.length > 12) {
    callback(new Error("姓名長度應是1-12"))
  } else {
    callback()
  }
}

function checkPhone (rule, value, callback){
  // let phoneReg = /(^1[3|4|5|6|7|8|9]\d{9}$)|(^09\d{8}$)/;
  if (value == "") {
    callback(new Error("請輸入手機號"))
  } else if (!isCellPhone(value)) {//引入methods中封装的检查手机格式的方法
    callback(new Error("請輸入正確手機好!"))
  } else {
    callback()
  }
}


function validID (rule,value,callback) {
  // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
  let reg = /^[A-Z]{1}[1-2]{1}[0-9]{8}$/
  if(value == '') {
    callback(new Error('請輸入身分證字號'))
  } else if (reg.test(value)) {
    callback()
  } else {
    callback(new Error('身分證字號不正確'))
  }
}