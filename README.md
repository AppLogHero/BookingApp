### Rules
1. Do not use dependencies (pods, spm...)
2. Do not use storyboard
3. Do not create new xib but use the existing one
4. Feel free to IMPROVE or FIX the existing code
5. Feel free to add comments and to improve UI
6. Feel free to add files and layers
7. Do not spend to much time on it, the idea is to discuss about your code :)

### What should be done
1. App must be universal and compatible iOS 12
2. BookingTableViewController must show a list of 25 bookings (Use the API call described in Client.swift). Each booking cell should contain at least the user name and the booking status
3. BookingTableViewController must be embedded in a UISplitViewController
4. BookingDetailViewController must be the detail of this UISplitViewController and must show booking details.
5. BookingDetailViewController must contains a button which show the BookingStatusController in modal
6. BookingStatusController should be instantiate using the .xib
7. BookingStatusController must allow the user to change the current booking status
8. HomeViewController must present the color of the status of the first booking in the list
9. Prepare the project for both english and french languages

### Bonus
- Add a unit test for the Client class
