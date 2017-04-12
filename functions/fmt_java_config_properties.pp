function extlib::format_java_properties (
  Data $properties,
  String $separator = '.',
  Optional[String] $classpath_attribute = undef,
  Optional[String] $prefix = undef
) {
  if $properties =~ Array {
    $v = join($properties, ',')
    $r = {"$prefix" => $v}
    $r
  } elsif $properties =~ Hash {
    $r = $properties.map |$key, $value| {
      if $classpath_attribute != undef and $key == $classpath_attribute {
        extlib::format_java_properties($value, $separator, undef, $prefix)
      } else {
        if $prefix {
          extlib::format_java_properties($value, $separator, $classpath_attribute, "${prefix}${separator}${key}")
        } else {
          extlib::format_java_properties($value, $separator, $classpath_attribute, $key)
        }
      }
    }.reduce({}) |$k, $v| { $k + $v }
    $r
  } else {
    $r = {"${prefix}" => $properties}
    $r
  }
}
