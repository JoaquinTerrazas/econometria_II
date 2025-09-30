clear
cd "C:\Users\Usuario\Desktop\CICLO WA\metria"

import excel "excelbase2", sheet("Hoja1") firstrow clear

br

gen mes=tm(2003m9) + _n-1
tsset mes,m


gen lpbi = log(pbid)
gen lipc = log(ipc)
gen lom = log(om)
gen ltc =log(tc)



varsoc lpbi lipc tasar tasaso lom ltc embig, maxlag(6)

varbasic lpbi lipc tasar tasaso lom ltc embig , lags(1/2) step(50) nograph

varstable, graph  dlabel

varbasic lpbi  lipc tasar tasaso lom ltc embig , lags(1/2) step(50) nograph

irf graph irf, impulse(tasaso) response(lpbi) level(75)
irf graph irf, impulse(tasaso) response(lipc) level(75)
irf graph irf, impulse(tasaso) response(tasar) level(75)
irf graph irf, impulse(tasaso) response (lom)  level(75)
irf graph irf, impulse(tasaso) response (ltc)  level(75)
irf graph irf, impulse(tasaso) response (embig)  level(75)
irf graph irf, impulse(tasar) response(lipc) level(75)