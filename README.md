# react-native-datepicker-ios

#### This component works only on iOS.

An implementation of React Native's DatePickerIOS with additional property 'calendar'

## Installation

```bash   
npm install react-native-datepicker-ios --save
```

```bash
react-native link react-native-datepicker-ios
```

## List of available calendars
* gregorian
* buddhist
* hijri (islamicUmmAlQura, islamic, islamicCivil, islamicTabular)
* chinese
* republicOfChina
* persian 
* japanese
* indian
* coptic
* iso8601

## Available props

Same as React Native DatePickerIOS (version 0.45)

### Additional props

| Name | Type| Default | Description |
| --- | --- | --- | --- |
| calendar | string | null | Set calendar type |

## Usage

```javascript
  import DatePickerIOS from 'react-native-datepicker-ios';
 
 <DatePickerIOS 
   calendar="buddhist"
   date={this.state.date}
   mode="date"
   onChange={(date) => this.setState({date})} />
```
