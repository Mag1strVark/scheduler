import React from 'react';
import styled from 'styled-components';

const StyledSelect = styled.select`
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 0 16px;
  gap: 8px;
  height: 30px;
  width: 248px;
  background: #FFFFFF;
  border: 1px solid #AFBAC3;
  border-radius: 5px;
`;


const Select = ({ options = [], onChange , onClick, dis}) => (
    <StyledSelect onChange={onChange} onClick={onClick}>
        <option selected disabled>{dis}</option>
        {options.map((option) => (
            <option key={option.value} value={option.value}>
                {option.name}
            </option>
        ))}
    </StyledSelect>
);

export default Select
