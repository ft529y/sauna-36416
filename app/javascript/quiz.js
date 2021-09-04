function quiz() {
  const question = document.getElementById('question');
  const choices = document.getElementById('choices');
  const btn = document.getElementById('btn');
  const result = document.getElementById('result');
  const scoreLabel = document.querySelector('#result > p');
  
  const quizSet = shuffle([
    {q: '「整う」で重要なことは？？', c: ['外気浴', '岩盤浴', '半身浴']},
    {q: 'ロウリュサウナはどこの国、発祥？？', c: ['フィンランド', 'ノルウェー', 'スウェーデン']},
    {q: 'アウフグースとは？？', c: ['タオルを振って熱波を起こし発汗を促すこと', 'サウナ室の温度を上げ発汗を促すこと', '焼けた石に水をかけ、発せられる蒸気で発汗を促すこと']},
    {q: '「サウナ」、「水風呂」、「外気浴」を正しく行うことで得られる正しい効能は？？', c: ['交感神経、副交感神経が刺激され、自律神経が調整される', '体の芯から温まることができる', '発汗することでダイエット効果が期待できる']},
    {q: 'サウナハットを被る本当の目的は？？', c: ['頭部を熱から守るため', 'お洒落を楽しむため', '髪の毛が濡れないようにするため']},
  ]);
  let currentNum = 0;
  let isAnswered;
  let score = 0;
  
  
  function shuffle(arr) {
    for(let i = arr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [arr[j], arr[i]] = [arr[i], arr[j]];
    }
    return arr;
  }

  function checkAnswer(li) {
    if (isAnswered === true) {
      return;
    }
    isAnswered = true;
    if (li.textContent === quizSet[currentNum].c[0]) {
      li.classList.add('correct');
      score++;
    } else {
      li.classList.add('wrong');
    }

    btn.classList.remove('disabled');
  }

  function setQuiz() {
    isAnswered = false;
    question.textContent = quizSet[currentNum].q;

    while(choices.firstChild) {
      choices.removeChild(choices.firstChild);
    }
    
    const shuffledChoices = shuffle([...quizSet[currentNum].c]);
    shuffledChoices.forEach(choice => {
      const li = document.createElement('li');
      li.textContent = choice;
      li.addEventListener('click', () => {
        checkAnswer(li);
      });
      choices.appendChild(li);
    });

    if (currentNum === quizSet.length - 1) {
      btn.textContent = 'スコアを表示する！';
    }
  }

  setQuiz();

  btn.addEventListener('click', () => {
    if (btn.classList.contains('disabled')) {
      return;
    }
    btn.classList.add('disabled');
    if (currentNum === quizSet.length - 1) {
      scoreLabel.textContent = `正解数は${quizSet.length}問中${score}問です！！`;
      result.classList.remove('hidden');
    } else {
      currentNum++;
      setQuiz();
    }
  });
}

window.addEventListener('load', quiz)



