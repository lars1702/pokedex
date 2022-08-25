bool toBool(val) {
  if (val == false)
    return false;
  else if (val == null)
    return false;
  else if (val is String && val == "")
    return false;
  else if (val is num && val == 0)
    return false;
  else if (val is num && val.isNaN) return false;

  return true;
}
