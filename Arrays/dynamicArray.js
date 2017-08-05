function processData(input) {
    //Enter your code here

    //Initialize variables
    let lastAnswer = 0;
    const seqList = [];

    //Read variables from input
    const rows = input.split("\n");
    const row1 = rows[0].split(' ');
    const N = parseInt(row1[0]);
    const Q = parseInt(row1[1]);

    for (var idx = 0; idx < N; idx++) {
        seqList.push([]);
    }

    for (var i = 1; i <= Q; i++) {
        let queryType;
        let x;
        let y;
        [queryType, x, y] = processRow(rows[i]);
        if (queryType === 1) {
            seqList[(x ^ lastAnswer) % N].push(y);
        } else if (queryType === 2) {
            let sequence = seqList[(x ^ lastAnswer) % N];
            lastAnswer = sequence[y % sequence.length];
            console.log(lastAnswer);
        }
    }
}



function processRow(row) {
    const stringElements = row.split(' ');
    return stringElements.map(element => parseInt(element));
}

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});
