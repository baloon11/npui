Ext.data.JsonP.Extensible_calendar_dd_DragZone({"tagname":"class","name":"Extensible.calendar.dd.DragZone","autodetected":{"aliases":true,"alternateClassNames":true,"extends":true,"mixins":true,"requires":true,"uses":true,"members":true,"code_type":true},"files":[{"filename":"DragZone.js","href":"DragZone.html#Extensible-calendar-dd-DragZone"}],"private":true,"aliases":{},"alternateClassNames":[],"extends":"Ext.dd.DragZone","mixins":[],"requires":["Ext.util.Point","Extensible.calendar.data.EventMappings","Extensible.calendar.dd.StatusProxy"],"uses":[],"members":[{"name":"ddGroup","tagname":"property","owner":"Extensible.calendar.dd.DragZone","id":"property-ddGroup","meta":{"private":true}},{"name":"eventSelector","tagname":"property","owner":"Extensible.calendar.dd.DragZone","id":"property-eventSelector","meta":{"private":true}},{"name":"eventSelectorDepth","tagname":"property","owner":"Extensible.calendar.dd.DragZone","id":"property-eventSelectorDepth","meta":{"private":true}},{"name":"constructor","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-constructor","meta":{}},{"name":"afterInvalidDrop","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-afterInvalidDrop","meta":{"private":true}},{"name":"afterRepair","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-afterRepair","meta":{"private":true}},{"name":"destroy","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-destroy","meta":{"private":true}},{"name":"getDragData","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-getDragData","meta":{"private":true}},{"name":"getRepairXY","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-getRepairXY","meta":{"private":true}},{"name":"onInitDrag","tagname":"method","owner":"Extensible.calendar.dd.DragZone","id":"method-onInitDrag","meta":{"private":true}}],"code_type":"ext_define","id":"class-Extensible.calendar.dd.DragZone","short_doc":"Internal drag zone implementation for the calendar components. ...","component":false,"superclasses":["Ext.dd.DragZone"],"subclasses":["Extensible.calendar.dd.DayDragZone"],"mixedInto":[],"parentMixins":[],"html":"<div><pre class=\"hierarchy\"><h4>Hierarchy</h4><div class='subclass first-child'>Ext.dd.DragZone<div class='subclass '><strong>Extensible.calendar.dd.DragZone</strong></div></div><h4>Requires</h4><div class='dependency'>Ext.util.Point</div><div class='dependency'><a href='#!/api/Extensible.calendar.data.EventMappings' rel='Extensible.calendar.data.EventMappings' class='docClass'>Extensible.calendar.data.EventMappings</a></div><div class='dependency'><a href='#!/api/Extensible.calendar.dd.StatusProxy' rel='Extensible.calendar.dd.StatusProxy' class='docClass'>Extensible.calendar.dd.StatusProxy</a></div><h4>Subclasses</h4><div class='dependency'><a href='#!/api/Extensible.calendar.dd.DayDragZone' rel='Extensible.calendar.dd.DayDragZone' class='docClass'>Extensible.calendar.dd.DayDragZone</a></div><h4>Files</h4><div class='dependency'><a href='source/DragZone.html#Extensible-calendar-dd-DragZone' target='_blank'>DragZone.js</a></div></pre><div class='doc-contents'><div class='rounded-box private-box'><p><strong>NOTE:</strong> This is a private utility class for internal use by the framework. Don't rely on its existence.</p></div><p>Internal drag zone implementation for the calendar components. This provides base functionality\nand is primarily for the month view -- DayViewDD adds day/week view-specific functionality.</p>\n</div><div class='members'><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-property'>Properties</h3><div class='subsection'><div id='property-ddGroup' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-property-ddGroup' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-property-ddGroup' class='name expandable'>ddGroup</a> : <a href=\"#!/api/String\" rel=\"String\" class=\"docClass\">String</a><span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<p>Defaults to: <code>'CalendarDD'</code></p></div></div></div><div id='property-eventSelector' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-property-eventSelector' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-property-eventSelector' class='name expandable'>eventSelector</a> : <a href=\"#!/api/String\" rel=\"String\" class=\"docClass\">String</a><span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<p>Defaults to: <code>'.ext-cal-evt'</code></p></div></div></div><div id='property-eventSelectorDepth' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-property-eventSelectorDepth' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-property-eventSelectorDepth' class='name expandable'>eventSelectorDepth</a> : <a href=\"#!/api/Number\" rel=\"Number\" class=\"docClass\">Number</a><span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<p>Defaults to: <code>10</code></p></div></div></div></div></div><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-method'>Methods</h3><div class='subsection'><div id='method-constructor' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-constructor' target='_blank' class='view-source'>view source</a></div><strong class='new-keyword'>new</strong><a href='#!/api/Extensible.calendar.dd.DragZone-method-constructor' class='name expandable'>Extensible.calendar.dd.DragZone</a>( <span class='pre'>el, config</span> ) : <a href=\"#!/api/Extensible.calendar.dd.DragZone\" rel=\"Extensible.calendar.dd.DragZone\" class=\"docClass\">Extensible.calendar.dd.DragZone</a><span class=\"signature\"></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>el</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li><li><span class='pre'>config</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'><a href=\"#!/api/Extensible.calendar.dd.DragZone\" rel=\"Extensible.calendar.dd.DragZone\" class=\"docClass\">Extensible.calendar.dd.DragZone</a></span><div class='sub-desc'>\n</div></li></ul><h3 class='pa'>Fires</h3><ul></ul></div></div></div><div id='method-afterInvalidDrop' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-afterInvalidDrop' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-method-afterInvalidDrop' class='name expandable'>afterInvalidDrop</a>( <span class='pre'>e, id</span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>e</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li><li><span class='pre'>id</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul></div></div></div><div id='method-afterRepair' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-afterRepair' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-method-afterRepair' class='name expandable'>afterRepair</a>( <span class='pre'></span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n</div></div></div><div id='method-destroy' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-destroy' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-method-destroy' class='name expandable'>destroy</a>( <span class='pre'></span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class='pa'>Fires</h3><ul></ul></div></div></div><div id='method-getDragData' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-getDragData' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-method-getDragData' class='name expandable'>getDragData</a>( <span class='pre'>e</span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>e</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul></div></div></div><div id='method-getRepairXY' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-getRepairXY' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-method-getRepairXY' class='name expandable'>getRepairXY</a>( <span class='pre'>e</span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>e</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul></div></div></div><div id='method-onInitDrag' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='Extensible.calendar.dd.DragZone'>Extensible.calendar.dd.DragZone</span><br/><a href='source/DragZone.html#Extensible-calendar-dd-DragZone-method-onInitDrag' target='_blank' class='view-source'>view source</a></div><a href='#!/api/Extensible.calendar.dd.DragZone-method-onInitDrag' class='name expandable'>onInitDrag</a>( <span class='pre'>x, y</span> )<span class=\"signature\"><span class='private' >private</span></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>x</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li><li><span class='pre'>y</span> : <a href=\"#!/api/Object\" rel=\"Object\" class=\"docClass\">Object</a><div class='sub-desc'></div></li></ul><h3 class='pa'>Fires</h3><ul></ul></div></div></div></div></div></div></div>","meta":{"private":true}});