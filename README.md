# TodayExtension

Today Extension(Widget) is one of mostly used Extension. It has:-

1. It has used one of Apple template (Today Extension).  File -> New Target  

2. Make App group for making dynamic changes in Widget. Make sure that u have to enable App group(in capabilities) in both Application Target and Extension.

3. Make NSUserDefaults initialise with suite name (App Group) for implementing run-time changes in Widget.

4. Astronomical concern is make widget Actionable by using URL types -> Item -> URL identifier (Bundle Identifier)-> URL Schemes -> item (Name for navigation reference) in Info.plist of project target. 

5. Use openURL: method in AppDelegate then do ur navigation by setting extern bool or by firing notification.

P.S. - Added support for multiple targets. check this running app and write something in a text field and hit the button. Then go to Home screen and add widgets by tapping on 1 new Widget available.
