import React from "react";
import styled from "styled-components";

const StyledDateInput = styled.div`
    
`;

const InputDate2 = (startDate,endDate,onChange1, onChange2) => {
    return (
        <StyledDateInput>
            <input type="date" value={startDate} onChange={onChange1} />
            <span> - </span>
            <input type="date" value={endDate} onChange={onChange2} />
        </StyledDateInput>
    )
}

export default InputDate2
