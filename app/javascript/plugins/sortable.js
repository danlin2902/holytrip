import { Sortable } from '@shopify/draggable';

const sortable = new Sortable(document.querySelectorAll('.task'), {
  draggable: '.task-body'
});

sortable.on('sortable:start', () => console.log('sortable:start'));
sortable.on('sortable:sort', () => console.log('sortable:sort'));
sortable.on('sortable:sorted', () => console.log('sortable:sorted'));
sortable.on('sortable:stop', () => console.log('sortable:stop'));
