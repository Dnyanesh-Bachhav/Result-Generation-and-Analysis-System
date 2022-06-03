class TableCellEditing {
    // constructor(table){
    // 	this.tbody = table.querySelector('tbody');
    // }

    init() {
        // this.tbody = table.querySelector('tbody');
        // this.tds  = this.tbody.querySelectorAll('td');
        this.inputVal = document.getElementById('inputVal');
        this.tds = document.querySelectorAll('td');

        var table1 = document.getElementById('table1');
        var getTBody = table1.getElementsByTagName("tbody")[0];
        getTBody.onclick = function (e) {
            console.log(e.target.parentNode.rowIndex)
            //console.log(e.target.innerHTML)
        };

        this.tds.forEach(td => {
            td.setAttribute('contenteditable', true);
            td.addEventListener('click', (ev) => {
                if (!this.inEditing(td)) {
                    this.startEditing(td);
                }
            });
        });
    }
    startEditing(td) {

        const activeID = this.findEditing()
        if (activeID) {
            this.cancelEditing(activeID);
        }
        td.className = 'in-editing';
        td.setAttribute('data-old-value', td.innerHTML);
        this.createButtonToolbar(td);
    }
    cancelEditing(td) {
        td.innerHTML = td.getAttribute('data-old-value')
        td.classList.remove('in-editing');
        //this.removeToolbar(td);
    }
    finishEditing(td) {
        td.classList.remove('in-editing');

        this.removeToolbar(td);
    }
    inEditing(td) {
        return td.classList.contains('in-editing');
    }

    createButtonToolbar(td) {
        const toolbar = document.createElement('div');
        toolbar.className = 'button-toolbar';
        toolbar.setAttribute('contenteditable', false);

        toolbar.innerHTML = `
 <div class="button-wrapper">	
 <button class="btn btn-sm btn-danger btn-cancel">Cancel</button>
 <button class="btn btn-sm btn-primary btn-save">Save</button>
	
 </div>
`
        td.appendChild(toolbar);

        const btnSave = toolbar.querySelector('.btn-save');
        const btnCancel = toolbar.querySelector('.btn-cancel');
        btnSave.addEventListener('click', (ev) => {
            ev.stopPropagation();
            this.finishEditing(td)
            var currentVal = td.innerHTML;
            console.log(currentVal);
            inputVal.value = currentVal;
//console.log(td.rowIndex);
//console.log($(function(){
//        return $(this).closest("tr").index()}));


        });
        btnCancel.addEventListener('click', (ev) => {
            ev.stopPropagation();
            this.cancelEditing(td);
        })


    }
    removeToolbar(td) {
        const toolbar = td.querySelector('.button-toolbar');
        toolbar.remove();

    }
    findEditing(td) {
        return Array.prototype.find.call(this.tds, td => this.inEditing(td))
    }

}

var checks = document.getElementsByClassName("check");
console.log(checks);
let table = new TableCellEditing();
for(i=0;i<63;i++)
{
if(checks[i].checked===true)
{
table.init();
}
}
