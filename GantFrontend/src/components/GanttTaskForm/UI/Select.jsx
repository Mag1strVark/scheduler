import React from 'react';
import styled from 'styled-components';
import shape from "../../../assets/img/shape.svg"

const Wrapper = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 4px;
`;

// const IconWrapper = styled.div`
//   position: absolute;
// `;

const Label = styled.label`
  font-weight: bold;
  font-size: 14px;
  line-height: 16px;
  color: #000000;
`;

const SelectItem = styled.select`
  //position: relative;
  width: 184px;
  height: 32px;
  border: 1px solid #AFBAC3;
  background: #FFFFFF;
  border-radius: 5px;
  padding: 0 8px;
  font-size: 14px;
  text-overflow: ellipsis;
`;

const Option = styled.option`
  font-size: 1rem;
`;

const Select = ({ label, icon, defaultValue, options, value, onChange, disabled = false }) => {
    return (
        <Wrapper>
            {label && <Label>{label}</Label>}
            {/*<IconWrapper>{icon}</IconWrapper>*/}
            <SelectItem value={value} defaultValue={defaultValue} onChange={onChange} disabled={disabled}>
                {options.map((option) => (
                    <Option key={option.value} value={option.value}>
                        {option.name}
                    </Option>
                ))}
            </SelectItem>
        </Wrapper>
    );
};

export default Select;
