# Facade Progress

This issue acts as a project overview and if everything goes to plan it should be the very last issue to be closed.

## Progress Labels

| Progress (%) | Color | Description                 |
| :----------: | :---: | :-------------------------- |
|     100      |  🟢   | Absolutely complete         |
|   76 - 99    |  🟡   | Inconsistent or almost done |
|   26 - 75    |  🟠   | Needs work                  |
|    0 - 25    |  🔴   | Not started                 |

| Progress | Endpoint                               |  Type  | Assignee |
| :------: | :------------------------------------- | :----: | :------: |
|    🟠    | `/authentication`                      |  GET   | @kiko-g  |
|    🟠    | `/authentication/login`                |  POST  |          |
|    🟠    | `/authentication/register`             |  POST  |          |
|    🟠    | `/authentication/logout`               |  POST  |          |
|    🔴    | `/associations`                        |  GET   | @kiko-g  |
|    🟢    | `/curricular-unit/{id}`                |  GET   | @kiko-g  |
|    🔴    | `/curricular-unit/{id}/url`            |  GET   | @kiko-g  |
|    🟠    | `/exams-calendar/{courseId}`           |  GET   |          |
|    🔴    | `/exams-calendar/{courseId}/url`       |  GET   |          |
|    🟠    | `/grades/{studentNumber}`              |  GET   | @kiko-g  |
|    🔴    | `/groups`                              |  GET   |          |
|    🔴    | `/groups`                              | PATCH  |          |
|    🔴    | `/groups/{id}`                         | DELETE |          |
|    🔴    | `/myGroups/{userId}`                   |  GET   |          |
|    🔴    | `/groups/{groupId}/members`            |  GET   |          |
|    🔴    | `/groups/{groupId}/members/{memberId}` |  GET   |          |
|    🔴    | `/groups/{groupId}/members/{memberId}` |  POST  |          |
|    🔴    | `/groups/{groupId}/members/{memberId}` | DELETE |          |
|    🔴    | `/groups/{id}/admins`                  |  GET   |          |
|    🔴    | `/groups/{id}/members/{userId}`        |  POST  |          |
|    🔴    | `/groups/{id}/admins/{userId}`         | DELETE |          |
|    🟠    | `/meals/{restaurant}`                  |  GET   |          |
|    🟢    | `/news`                                |  GET   | @kiko-g  |
|    🔴    | `/news/url`                            |  GET   |          |
|    🟠    | `/profile/{studentNumber}`             |  GET   |          |
|    🟠    | `/schedule/student`                    |  GET   |          |
|    🟠    | `/services/{serviceNumber}`            |  GET   |          |
|    🔴    | `/services/{serviceNumber}/url`        |  GET   |          |
|    🟠    | `/status`                              |  GET   |          |
|    🟠    | `/student-exams/{studentNumber}`       |  GET   |          |
|    🔴    | `/student-exams/{studentNumber}/url`   |  GET   |          |
|    🟠    | `/user/{id}`                           | DELETE |          |
|    🟠    | `/user/update-password/{id}`           |  PUT   |          |
|    🟠    | `/user/forgot-password`                |  PUT   |          |
|    🟠    | `/user/reset-password`                 |  PUT   |          |
|    🟠    | `/calendar`                            |  GET   |          |
|    🟠    | `/calendar/create`                     |  POST  |          |
|    🔴    | `/calendar/google-calendar-token`      |  GET   |          |
|    🔴    | `/calendar/exportgc`                   |  POST  |          |
|    🟢    | `/capacity`                            |  GET   | @kiko-g  |
|    🟡    | `/feedback/meal`                       |  POST  | @kiko-g  |
|    🟡    | `/feedback/meal`                       |  GET   | @kiko-g  |
|    🟡    | `/feedback/teacher`                    |  POST  | @kiko-g  |
|    🟡    | `/feedback/teacher`                    |  GET   | @kiko-g  |
|    🔴    | `/jobs`                                |  GET   | @kiko-g  |
|    🔴    | `/{user}`                              |  POST  |          |
|    🔴    | `/{user}/all`                          |  GET   |          |
|    🔴    | `/topic/{topic}`                       |  POST  |          |
|    🔴    | `/topic/{topic}`                       | DELETE |          |
|    🔴    | `/user/{deviceToken}`                  |  POST  |          |
|    🔴    | `/user/{deviceToken}`                  | DELETE |          |
|    🔴    | `/queue`                               |  POST  |          |
|    🔴    | `/queue`                               |  GET   |          |
