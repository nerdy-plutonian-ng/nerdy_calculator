import '../models/pad_item.dart';
import '../models/pad_item_type.dart';

const padItems = [
  //Row1
  PadItem(
      label: '%',
      type: PadItemType.binaryOperator,
      isAdvanced: true,
      description: 'Modulo'),
  PadItem(
      label: 'CE',
      type: PadItemType.unaryOperator,
      isAdvanced: false,
      description: 'Clear everything'),
  PadItem(
      label: 'C',
      type: PadItemType.unaryOperator,
      isAdvanced: false,
      description: 'Clear'),
  PadItem(
      label: '+/-',
      type: PadItemType.unaryOperator,
      isAdvanced: false,
      description: 'Negate'),
  PadItem(
      label: '+',
      type: PadItemType.binaryOperator,
      isAdvanced: false,
      description: 'Add'),
  PadItem(
      label: 'x^X',
      type: PadItemType.binaryOperator,
      isAdvanced: true,
      description: 'Power'),
  PadItem(
      label: '1',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'One'),
  PadItem(
      label: '2',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Two'),
  PadItem(
      label: '3',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Three'),
  PadItem(
      label: '-',
      type: PadItemType.binaryOperator,
      isAdvanced: false,
      description: 'Subtract'),
  //Ro3
  PadItem(
      label: 'sin',
      type: PadItemType.unaryOperator,
      isAdvanced: true,
      description: 'Sine'),
  PadItem(
      label: '4',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Four'),
  PadItem(
      label: '5',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Five'),
  PadItem(
      label: '6',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Six'),
  PadItem(
      label: 'x',
      type: PadItemType.binaryOperator,
      isAdvanced: false,
      description: 'Multiply'),
  //Row4
  PadItem(
      label: 'cos',
      type: PadItemType.unaryOperator,
      isAdvanced: true,
      description: 'Cosine'),
  PadItem(
      label: '7',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Seven'),
  PadItem(
      label: '8',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Eight'),
  PadItem(
      label: '9',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Nine'),
  PadItem(
      label: '/',
      type: PadItemType.binaryOperator,
      isAdvanced: false,
      description: 'Division'),
  //Row5
  PadItem(
      label: 'tan',
      type: PadItemType.unaryOperator,
      isAdvanced: true,
      description: 'Tangent'),
  PadItem(
      label: '0',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Zero'),
  PadItem(
      label: '.',
      type: PadItemType.number,
      isAdvanced: false,
      description: 'Decimal point'),
  PadItem(
      label: '=',
      type: PadItemType.binaryOperator,
      isAdvanced: false,
      description: 'Equal to'),
];
