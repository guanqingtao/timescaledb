-- This file and its contents are licensed under the Timescale License.
-- Please see the included NOTICE for copyright information and
-- LICENSE-TIMESCALE for a copy of the license.

\set ON_ERROR_STOP 0

--negative tests for query validation
create table matt1 ( a integer, b integer);

create  view mat_m1 WITH ( timescaledb.continuous_agg = 'start', timescaledb.myfill = 1)
as
select location , min(temperature)
from conditions 
group by time_bucket('1d', time), location;

create  view mat_m1 WITH ( timescaledb.continuous_agg = 'start', check_option = LOCAL )
as
select * from conditions , matt1;
