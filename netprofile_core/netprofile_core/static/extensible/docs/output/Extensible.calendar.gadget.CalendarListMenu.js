Ext.data.JsonP.Extensible_calendar_gadget_CalendarListMenu({"tagname":"class","name":"Extensible.calendar.gadget.CalendarListMenu","autodetected":{"aliases":true,"alternateClassNames":true,"extends":true,"mixins":true,"requires":true,"uses":true,"members":true,"code_type":true},"files":[{"filename":"CalendarListMenu.js","href":"CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu"}],"private":true,"aliases":{"widget":["extensible.calendarlistmenu"]},"alternateClassNames":[],"extends":"Ext.menu.Menu","mixins":[],"requires":["Extensible.calendar.util.ColorPicker"],"uses":[],"members":[{"name":"calendarId","tagname":"cfg","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"cfg-calendarId","meta":{}},{"name":"displayOnlyThisCalendarText","tagname":"cfg","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"cfg-displayOnlyThisCalendarText","meta":{}},{"name":"hideOnClick","tagname":"cfg","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"cfg-hideOnClick","meta":{}},{"name":"ignoreParentClicks","tagname":"cfg","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"cfg-ignoreParentClicks","meta":{}},{"name":"palette","tagname":"property","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"property-palette","meta":{}},{"name":"afterRender","tagname":"method","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"method-afterRender","meta":{"private":true}},{"name":"handleColorSelect","tagname":"method","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"method-handleColorSelect","meta":{"private":true}},{"name":"handleRadioCalendarClick","tagname":"method","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"method-handleRadioCalendarClick","meta":{"private":true}},{"name":"initComponent","tagname":"method","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"method-initComponent","meta":{"private":true}},{"name":"menuHide","tagname":"method","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"method-menuHide","meta":{"private":true}},{"name":"setCalendar","tagname":"method","owner":"Extensible.calendar.gadget.CalendarListMenu","id":"method-setCalendar","meta":{"chainable":true}}],"code_type":"ext_define","id":"class-Extensible.calendar.gadget.CalendarListMenu","component":false,"superclasses":["Ext.menu.Menu"],"subclasses":[],"mixedInto":[],"parentMixins":[],"html":"<div><pre class=\"hierarchy\"><h4>Hierarchy</h4><div class='subclass first-child'>Ext.menu.Menu<div class='subclass '><strong>Extensible.calendar.gadget.CalendarListMenu</strong></div></div><h4>Requires</h4><div class='dependency'><a href='#!/api/Extensible.calendar.util.ColorPicker' rel='Extensible.calendar.util.ColorPicker' class='docClass'>Extensible.calendar.util.ColorPicker</a></div><h4>Files</h4><div class='dependency'><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu' target='_blank'>CalendarListMenu.js</a></div></pre><div class='doc-contents'><div class='rounded-box private-box'><p><strong>NOTE:</strong> This is a private utility class for internal use by the framework. Don't rely on its existence.</p></div><p>A menu containing a <a href=\"#!/api/Extensible.calendar.util.ColorPicker\" rel=\"Extensible.calendar.util.ColorPicker\" class=\"docClass\">color picker</a> for choosing\ncalendar colors, as well as other calendar-specific options.</p>\n</div><div class='members'><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-cfg'>Config options</h3><div class='subsection'><div id='cfg-calendarId' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-cfg-calendarId' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-cfg-calendarId' class='name expandable'>calendarId</a> : <a href=\"#!/api/Number\" rel=\"Number\" class=\"docClass\">Number</a><span class=\"signature\"></span></div><div class='description'><div class='short'>The id of the calendar to be associated with this menu. ...</div><div class='long'><p>The id of the calendar to be associated with this menu. This calendarId will be passed\nback with any events from this menu to identify the calendar to be acted upon. The calendar\nid can also be changed at any time after creation by calling setCalendar.</p>\n</div></div></div><div id='cfg-displayOnlyThisCalendarText' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-cfg-displayOnlyThisCalendarText' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-cfg-displayOnlyThisCalendarText' class='name expandable'>displayOnlyThisCalendarText</a> : <a href=\"#!/api/String\" rel=\"String\" class=\"docClass\">String</a><span class=\"signature\"></span></div><div class='description'><div class='short'>The text to display for the 'Display only this calendar' option in the menu. ...</div><div class='long'><p>The text to display for the 'Display only this calendar' option in the menu.</p>\n<p>Defaults to: <code>'Display only this calendar'</code></p></div></div></div><div id='cfg-hideOnClick' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-cfg-hideOnClick' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-cfg-hideOnClick' class='name expandable'>hideOnClick</a> : <a href=\"#!/api/Boolean\" rel=\"Boolean\" class=\"docClass\">Boolean</a><span class=\"signature\"></span></div><div class='description'><div class='short'>False to continue showing the menu after a color is selected, defaults to true. ...</div><div class='long'><p>False to continue showing the menu after a color is selected, defaults to true.</p>\n<p>Defaults to: <code>true</code></p></div></div></div><div id='cfg-ignoreParentClicks' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-cfg-ignoreParentClicks' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-cfg-ignoreParentClicks' class='name expandable'>ignoreParentClicks</a> : <a href=\"#!/api/Boolean\" rel=\"Boolean\" class=\"docClass\">Boolean</a><span class=\"signature\"></span></div><div class='description'><div class='short'>True to ignore clicks on any item in this menu that is a parent item (displays a submenu)\nso that the submenu is not ...</div><div class='long'><p>True to ignore clicks on any item in this menu that is a parent item (displays a submenu)\nso that the submenu is not dismissed when clicking the parent item (defaults to true).</p>\n<p>Defaults to: <code>true</code></p></div></div></div></div></div><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-property'>Properties</h3><div class='subsection'><div id='property-palette' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-property-palette' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-property-palette' class='name expandable'>palette</a> : ColorPicker<span class=\"signature\"></span></div><div class='description'><div class='short'><p>The <a href=\"#!/api/Extensible.calendar.util.ColorPicker\" rel=\"Extensible.calendar.util.ColorPicker\" class=\"docClass\">ColorPicker</a> instance for this CalendarListMenu</p>\n</div><div class='long'><p>The <a href=\"#!/api/Extensible.calendar.util.ColorPicker\" rel=\"Extensible.calendar.util.ColorPicker\" class=\"docClass\">ColorPicker</a> instance for this CalendarListMenu</p>\n</div></div></div></div></div><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-method'>Methods</h3><div class='subsection'><div id='method-afterRender' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-method-afterRender' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-method-afterRender' class='name expandable'>afterRender</a>( <span class='pre'></span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'>private ...</div><div class='long'><p>private</p>\n<h3 class='pa'>Fires</h3><ul></ul></div></div></div><div id='method-handleColorSelect' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-method-handleColorSelect' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-method-handleColorSelect' class='name expandable'>handleColorSelect</a>( <span class='pre'>cp, selColorId</span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'>private ...</div><div class='long'><p>private</p>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>cp</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li><li><span class='pre'>selColorId</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul><h3 class='pa'>Fires</h3><ul><li>colorchange</li></ul></div></div></div><div id='method-handleRadioCalendarClick' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-method-handleRadioCalendarClick' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-method-handleRadioCalendarClick' class='name expandable'>handleRadioCalendarClick</a>( <span class='pre'>e, t</span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'>private ...</div><div class='long'><p>private</p>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>e</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li><li><span class='pre'>t</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul><h3 class='pa'>Fires</h3><ul><li>radiocalendar</li></ul></div></div></div><div id='method-initComponent' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-method-initComponent' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-method-initComponent' class='name expandable'>initComponent</a>( <span class='pre'></span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'>private ...</div><div class='long'><p>private</p>\n<h3 class='pa'>Fires</h3><ul></ul></div></div></div><div id='method-menuHide' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-method-menuHide' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-method-menuHide' class='name expandable'>menuHide</a>( <span class='pre'></span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'>private ...</div><div class='long'><p>private</p>\n<h3 class='pa'>Fires</h3><ul></ul></div></div></div><div id='method-setCalendar' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.gadget.CalendarListMenu'>Extensible.calendar.gadget.CalendarListMenu</span><br/><a href='source/CalendarListMenu.html#Extensible-calendar-gadget-CalendarListMenu-method-setCalendar' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.gadget.CalendarListMenu-method-setCalendar' class='name expandable'>setCalendar</a>( <span class='pre'>calendarId, colorId</span> ) : <a href=\"#!/api/Extensible.calendar.gadget.CalendarListMenu\" rel=\"Extensible.calendar.gadget.CalendarListMenu\" class=\"docClass\">Extensible.calendar.gadget.CalendarListMenu</a><span class=\"signature\"><span class='chainable' >chainable</span></span></div><div class='description'><div class='short'>Sets the calendar id and color id to be associated with this menu. ...</div><div class='long'><p>Sets the calendar id and color id to be associated with this menu. This should be called each time the\nmenu is shown relative to a new calendar.</p>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>calendarId</span> : <a href=\"#!/api/Number\" rel=\"Number\" class=\"docClass\">Number</a><div class='sub-desc'><p>The id of the calendar to be associated</p>\n</div></li><li><span class='pre'>colorId</span> : <a href=\"#!/api/Number\" rel=\"Number\" class=\"docClass\">Number</a><div class='sub-desc'><p>The id of the color to be pre-selected in the color palette</p>\n</div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'><a href=\"#!/api/Extensible.calendar.gadget.CalendarListMenu\" rel=\"Extensible.calendar.gadget.CalendarListMenu\" class=\"docClass\">Extensible.calendar.gadget.CalendarListMenu</a></span><div class='sub-desc'><p>this</p>\n</div></li></ul></div></div></div></div></div></div></div>","meta":{"private":true}});