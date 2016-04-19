import Ember from 'ember';
import SelectValues from 'megd/utils/select-values';
export default Ember.Mixin.create({
  defaultVisitTypes: [
    'Admission',
    'Clinic',
    'Followup',
    'Imaging',
    'Lab',
    'Pharmacy'
  ],

  _getVisitTypes: function(includeEmpty) {
    var defaultVisitTypes = this.get('defaultVisitTypes'),
      visitTypesList = this.get('visitTypesList'),
      visitList;
    if (Ember.isEmpty(visitTypesList)) {
      visitList = defaultVisitTypes;
    } else {
      visitList = visitTypesList.get('value');
    }
    visitList = SelectValues.selectValues(visitList, includeEmpty);
    return visitList;
  },

  visitTypes: function() {
    return this._getVisitTypes();
  }.property('visitTypesList', 'defaultVisitTypes'),

  visitTypesWithEmpty: function() {
    return this._getVisitTypes(true);
  }.property('visitTypesList', 'defaultVisitTypes')
});