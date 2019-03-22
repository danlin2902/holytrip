import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import {MDCRipple} from '@material/ripple';


import { initMapbox } from '../plugins/init_mapbox';
import { initPlaces } from '../plugins/init_places';
import { addFields } from '../plugins/add_fields';

initMapbox();
initsearchAlgoliaPlaces();

const listItemRipples = list.listElements.map((listItemEl) => new MDCRipple(listItemEl));

addFields();

