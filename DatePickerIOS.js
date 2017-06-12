'use strict';
import React, { Component } from 'react';
import PropTypes from 'prop-types';
import {
  StyleSheet,
  Text,
  View,
  NativeModules,
  requireNativeComponent,
} from 'react-native';

const DatePickerIOS = React.createClass({

  propTypes: {
    date: PropTypes.instanceOf(Date).isRequired,
    onChange: PropTypes.func,
    onDateChange: PropTypes.func.isRequired,
    maximumDate: PropTypes.instanceOf(Date),
    minimumDate: PropTypes.instanceOf(Date),
    mode: PropTypes.oneOf(['date', 'time', 'datetime']),
    minuteInterval: PropTypes.oneOf([1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30]),
    timeZoneOffsetInMinutes: PropTypes.number,
    dateFormat: PropTypes.string,
    calendar: PropTypes.string,
  },

  getDefaultProps: function () {
    return {
      mode: 'datetime'
    };
  },

  _onChange(event) {
    const nativeTimeStamp = event.nativeEvent.timestamp;
    this.props.onDateChange && this.props.onDateChange(
      new Date(nativeTimeStamp)
    );

    this.props.onChange && this.props.onChange(event);

    const propsTimeStamp = this.props.date.getTime();
    if (this._picker && nativeTimeStamp !== propsTimeStamp) {
      this._picker.setNativeProps({
        date: propsTimeStamp,
      });
    }
  },
  
  render() {
    const props = this.props;
    return (
      <View style={props.style}>
        <RCTDatePickerIos
          ref={ picker => { this._picker = picker; } }
          style={styles.datePickerIOS}
          date={props.date.getTime()}
          maximumDate={
            props.maximumDate ? props.maximumDate.getTime() : undefined
          }
          minimumDate={
            props.minimumDate ? props.minimumDate.getTime() : undefined
          }
          mode={props.mode}
          minuteInterval={props.minuteInterval}
          timeZoneOffsetInMinutes={props.timeZoneOffsetInMinutes}
          calendar={props.calendar}
          // dateFormat={props.dateFormat}
          onChange={this._onChange}
          onStartShouldSetResponder={() => true}
          onResponderTerminationRequest={() => false}
        />
      </View>
    );
  }
});
const styles = StyleSheet.create({
  datePickerIOS: {
    height: 216,
  },
});

var RCTDatePickerIos = requireNativeComponent('RCTCustomDatePickerIOS', {
  propTypes: {
    ...DatePickerIOS.propTypes,
    date: PropTypes.number,
    minimumDate: PropTypes.number,
    maximumDate: PropTypes.number,
    onDateChange: () => null,
    onChange: PropTypes.func,
  }
});

module.exports = DatePickerIOS;