import 'package:iiitdmjcompanion/models/class/class.dart';

import 'mess_menu.dart';

List<MessMenu> menus = [
  for (var i = 0; i < 7; i++)
    MessMenu(
        breakfast: breakfast[i].toString().split(', '),
        lunch: lunch[i].toString().split(', '),
        dinner: dinner[i].toString().split(', '),
        day: Class.dayIntMap[i + 1])
];

List breakfast = [
  'Vada-Pav, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Pasta, Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Uttapam, Nariyal Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Halwa, Chane, Sprouts, Toast, Tea, Butter, Milk',
  'Methi Parathe, Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Dosa, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Aaloo Paratha, Chutney, Sprouts, Toast, Tea, Butter, Milk'
];
List lunch = [
  'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
  'Dal, Sabji, Roti, Rice, Salad',
  'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
  'Halwa, Chane, Sprouts, Toast, Tea, Butter, Milk',
  'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
  'Dosa, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad'
];
List dinner = [
  'Dal, Roti, Rice, Dal, Salad',
  'Dal, Sabji, Pulao, Rice, Salad',
  'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
  'Halwa, Chane, Sprouts, Toast, Tea, Butter, Milk',
  'Chhole-Bhatoore, Dahi, Roti, Rice, Dal, Salad',
  'Dosa, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
  'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad'
];
