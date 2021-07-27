function calc () {
  
  //入力体重変更時
  const weightInput = document.getElementById("goal_weight");
  if ( document.getElementById("goal_weight")){
    weightInput.addEventListener("input", () => {
    
    const inputValue = weightInput.value;
  
    const getBasisWeight = document.getElementById("basis_weight");
    const basisWeight = getBasisWeight.innerHTML;
    const lossWeight = basisWeight - inputValue;
      
    const addWeight = document.getElementById("loss_weight");
    addWeight.innerHTML = lossWeight;
  
    const getPeriod = document.getElementById("period").value;
    const totalCalorie = lossWeight * 7200;
    const monthCalorie = totalCalorie / getPeriod;
    const dayCalorie = monthCalorie / 30;
    
    const addCalorie = document.getElementById("calorie");
    addCalorie.innerHTML = dayCalorie;
    });
  }

  // 期間変更時
  const periodInput =document.getElementById("period")
  if ( document.getElementById("period")){
    periodInput.addEventListener("input", () => {
    
      const inputValue = weightInput.value;
    
      const getBasisWeight = document.getElementById("basis_weight");
      const basisWeight = getBasisWeight.innerHTML;
      const lossWeight = basisWeight - inputValue;
        
      const addWeight = document.getElementById("loss_weight");
      addWeight.innerHTML = lossWeight;
    
      const getPeriod = document.getElementById("period").value;
      const totalCalorie = lossWeight * 7200;
      const monthCalorie = totalCalorie / getPeriod;
      const dayCalorie = monthCalorie / 30;
      
      const addCalorie = document.getElementById("calorie");
      addCalorie.innerHTML = dayCalorie;
    });
  }
};

window.addEventListener('load', calc);