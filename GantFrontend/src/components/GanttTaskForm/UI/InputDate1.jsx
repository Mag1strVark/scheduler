import React from 'react';
import styled from 'styled-components';

const StyledInput = styled.input`
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 184px;
  height: 32px;
  border-radius: 5px;
  border: 1px solid var(--basic-grey, #AFBAC3);
  background: #FFF;
  font-size: 14px;
  padding-left: 28px;
`;

const StyledDiv = styled.div`
  display: flex;
  align-items: center;
  position: relative;
`

const StyledSpan = styled.span`
  position: absolute;
  top: 8px;
  left: 8px;
`;

const InputDate1 = ({ value, onChange, disabled, defaultValue, icon }) => (
  <StyledDiv>
      <StyledSpan>{icon}</StyledSpan>
      <StyledInput type="date" defaultValue={defaultValue} value={value} onChange={onChange} disabled={disabled}/>
  </StyledDiv>
)

export default InputDate1
