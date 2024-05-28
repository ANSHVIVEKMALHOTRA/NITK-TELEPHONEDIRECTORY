import 'package:TelephoneDirectory/models/facultyindividual.dart';

class Sorting{
  static List<facultyindividual> sort(String name,int departmentid,List<facultyindividual> all)
  {
    List<facultyindividual> filteredlist = all.where((element) {
        //Logic for the sorting part
        if (name == "" && departmentid == -1) {
          return true;
        } else {
          if (name != "" && departmentid == -1) {
            return element.name!.toLowerCase().contains(name.toLowerCase());
          } else if (name == "" && departmentid != -1) {
            return element.departmentId == departmentid;
          } else if (name != "" && departmentid != -1) {
            return element.name!.toLowerCase().contains(name.toLowerCase()) &&
                element.departmentId == departmentid;
          }
        }
        return false;
      }).toList();

      if (name != "" || departmentid != -1) {
        filteredlist.sort((a, b) {
          // Compare based on custom order
          if (a.customOrder != b.customOrder) {
            return a.customOrder!.compareTo(b.customOrder!);
          } else {
            // If custom orders are the same, compare based on joining date
            if (a.joiningDate != null && b.joiningDate != null) {
              return a.joiningDate!.compareTo(b.joiningDate!);
            } else if (a.joiningDate == null && b.joiningDate == null) {
              // If joining dates are null for both, compare based on name
              return a.name!.compareTo(b.name!);
            } else if (a.joiningDate == null) {
              // Handle case when joining date of a is null
              return 1; // a comes after b
            } else {
              // Handle case when joining date of b is null
              return -1; // a comes before b
            }
          }
        });
      }
return filteredlist;
  }

}