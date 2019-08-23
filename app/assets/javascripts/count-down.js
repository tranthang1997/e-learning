$(document).ready(function() {
  function submitAnswer() {
    var data = {
      course_id: "",
      answers: []
    }
    data.course_id = document.getElementById("course_id").value
    var listQuestion = document.getElementsByClassName("question")
    var user_id = document.getElementById("user_id").value
    for (var i = 0; i < listQuestion.length; i++) {
      var questionId = listQuestion[i].dataset.questionId
      const answerChoose = document.querySelector('input[name="'+ "answer" + questionId +'"]:checked')
      var answer_id = null
      if (answerChoose) {
        answer_id = answerChoose.value
      }
      data.answers.push(
        {
          question_id: questionId,
          answer_id: answer_id
        }
      )
    }
    const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');

    $.ajax({
      url: "/lesson/submit-answer",
      type: "POST",
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', csrfToken)
      },
      data: {data_value: data},
      success: data => {
        if (data.value === "Success") {
          $('#confirmSumit').modal('hide');
          window.location.href = 'http://' + window.location.hostname + ':3000' + '/course/' + user_id + '/' + data.data.course_id + '/' + data.data.result_id  + '/view-result'
        }
      }
    })
  }

  function secondsToMs(d) {
    d = Number(d);
    let m = Math.floor(d % 3600 / 60);
    let s = Math.floor(d % 3600 % 60);
    return m +":"+ s;
  }

  $(".btn-finish-lesson").click(function () {
    submitAnswer()
  });

  let timer2 = secondsToMs(document.getElementById('time').value);
  const interval = setInterval(function() {
    const timer = timer2.split(':');
    let minutes = parseInt(timer[0], 10);
    let seconds = parseInt(timer[1], 10);
    --seconds;
    minutes = (seconds < 0) ? --minutes : minutes;
    if (minutes < 0) clearInterval(interval);
    seconds = (seconds < 0) ? 59 : seconds;
    seconds = (seconds < 10) ? '0' + seconds : seconds;
    $('.countdown').html(minutes + ':' + seconds);
    timer2 = minutes + ':' + seconds;
    if (minutes == 0 && seconds == 0) {
      submitAnswer()
    }
  }, 1000);
});
