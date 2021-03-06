Ext.define('NetProfile.view.MainBar', {
	extend: 'Ext.panel.Panel',
	alias: 'widget.mainbar',
	requires: [
		'NetProfile.view.PropBar'
	],
	id: 'npws_mainbar',
	stateId: 'npws_mainbar',
	stateful: true,
	layout: {
		type: 'border',
		padding: 0
	},
	mainWidget: null,
	items: [{
		region: 'south',
		xtype: 'propbar',
		split: true
	}],

	removeWidget: function()
	{
		if(this.mainWidget)
		{
			Ext.destroy(this.remove(this.mainWidget));
			this.mainWidget = null;
			return true;
		}
		return false;
	},
	replaceWith: function(comp)
	{
		this.removeWidget();
		this.mainWidget = this.add(comp);
		return this.mainWidget;
	}
});

