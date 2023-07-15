import React from 'react';
import styled from 'styled-components';

const InputField = styled.input`
  width: ${props => props.width ? props.width : 'fit-content'};
  height: ${props => props.height ? props.height : '40px'};
  padding: ${props => props.padding ? props.padding : '0px'};
  border: ${props => props.border ? props.border : 'none'};
  background: ${props => props.background ? props.background : 'none'};
  // font-size: 20px;
  // font-weight: 700;
  font-size: ${props => props.fontSize ? props.fontSize : '14px'};
  font-weight: ${props => props.fontWeight ? props.fontWeight : '500'};
  border-radius: 5px;

  &::placeholder{
    text-align: left;
    vertical-align: top;
  }

  &:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
  }
  
`;

const Text = ({ value, onChange, width, height, padding, border, background, fontSize, fontWeight, disabled = false, ...rest }) => (
    <InputField
        width={width}
        height={height}
        padding={padding}
        border={border}
        background={background}
        fontSize={fontSize}
        fontWeight={fontWeight}
        disabled={disabled}
        {...rest}
        placeholder="Название задачи"
        value={value}
        onChange={onChange}
    />
);
export default Text;
