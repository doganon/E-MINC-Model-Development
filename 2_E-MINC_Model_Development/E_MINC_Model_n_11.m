function out = model
%
% E_MINC_Model.m
% There are 1 fracture and 10 matrix domains

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.param.set('frac_aper', '0.01 [m]', 'fracture_aperture');
model.param.set('p_initial', '24*1e5[Pa]');
model.param.set('p_fracture', '20*1e5[Pa]');
model.param.set('t_end', '1e5', 'seconds');

model.component.create('comp3', true);

model.component('comp3').geom.create('geom3', 2);

model.component('comp3').label('MINC11');

model.result.table.create('evl2', 'Table');
model.result.evaluationGroup.create('eg2', 'EvaluationGroup');
model.result.evaluationGroup.create('eg3', 'EvaluationGroup');
model.result.evaluationGroup('eg2').create('int2', 'IntSurface');
model.result.evaluationGroup('eg3').create('int3', 'IntSurface');

model.func.create('an1', 'Analytic');
model.func('an1').set('expr', 'mat1.def.rho(P,T)');
model.func('an1').set('args', {'P' 'T'});
model.func('an1').set('argunit', {'Pa' 'K'});
model.func('an1').set('plotargs', {'P' '101325+2498.12118424503' '101325+2498.12118424503'; 'T' '273.15+20' '273.15+20.000001'});

model.component('comp3').mesh.create('mesh3');

model.component('comp3').geom('geom3').create('r1', 'Rectangle');
model.component('comp3').geom('geom3').feature('r1').set('size', [2 2]);
model.component('comp3').geom('geom3').create('sel1', 'ExplicitSelection');
model.component('comp3').geom('geom3').feature('sel1').label('Right_Boundary');
model.component('comp3').geom('geom3').feature('sel1').selection('selection').init(1);
model.component('comp3').geom('geom3').feature('sel1').selection('selection').set('r1(1)', 2);
model.component('comp3').geom('geom3').create('sel2', 'ExplicitSelection');
model.component('comp3').geom('geom3').feature('sel2').label('Left_Boundary');
model.component('comp3').geom('geom3').feature('sel2').selection('selection').init(1);
model.component('comp3').geom('geom3').feature('sel2').selection('selection').set('r1(1)', 4);
model.component('comp3').geom('geom3').run;
model.component('comp3').geom('geom3').run('fin');

model.frame('material1').tag('material16');
model.frame('mesh1').tag('mesh3');
model.frame('geometry1').tag('geometry3');
model.frame('spatial1').tag('spatial3');

model.component('comp3').variable.create('var1');
model.component('comp3').variable('var1').set('density_1', 'p1/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_2', 'p2/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_3', 'p3/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_4', 'p4/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_5', 'p5/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_6', 'p6/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_7', 'p7/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_8', 'p8/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_9', 'p9/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_10', 'p10/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('density_11', 'p11/mat1.idealGas.Rs/minput.T');
model.component('comp3').variable('var1').set('exchange_12', 'if(p1>p2, density_1/mat1.def.eta(minput.T)*transmiss_1_2*(p1-p2), density_2/mat1.def.eta(minput.T)*transmiss_1_2*(p1-p2))');
model.component('comp3').variable('var1').set('exchange_23', 'if(p2>p3, density_2/mat1.def.eta(minput.T)*transmiss_2_3*(p2-p3), density_3/mat1.def.eta(minput.T)*transmiss_2_3*(p2-p3))');
model.component('comp3').variable('var1').set('exchange_34', 'if(p3>p4, density_3/mat1.def.eta(minput.T)*transmiss_3_4*(p3-p4), density_4/mat1.def.eta(minput.T)*transmiss_3_4*(p3-p4))');
model.component('comp3').variable('var1').set('exchange_45', 'if(p4>p5, density_4/mat1.def.eta(minput.T)*transmiss_4_5*(p4-p5), density_5/mat1.def.eta(minput.T)*transmiss_4_5*(p4-p5))');
model.component('comp3').variable('var1').set('exchange_56', 'if(p5>p6, density_5/mat1.def.eta(minput.T)*transmiss_5_6*(p5-p6), density_6/mat1.def.eta(minput.T)*transmiss_5_6*(p5-p6))');
model.component('comp3').variable('var1').set('exchange_67', 'if(p6>p7, density_6/mat1.def.eta(minput.T)*transmiss_6_7*(p6-p7), density_7/mat1.def.eta(minput.T)*transmiss_6_7*(p6-p7))');
model.component('comp3').variable('var1').set('exchange_78', 'if(p7>p8, density_7/mat1.def.eta(minput.T)*transmiss_7_8*(p7-p8), density_8/mat1.def.eta(minput.T)*transmiss_7_8*(p7-p8))');
model.component('comp3').variable('var1').set('exchange_89', 'if(p8>p9, density_8/mat1.def.eta(minput.T)*transmiss_8_9*(p8-p9), density_9/mat1.def.eta(minput.T)*transmiss_8_9*(p8-p9))');
model.component('comp3').variable('var1').set('exchange_910', 'if(p9>p10, density_9/mat1.def.eta(minput.T)*transmiss_9_10*(p9-p10), density_10/mat1.def.eta(minput.T)*transmiss_9_10*(p9-p10))');
model.component('comp3').variable('var1').set('exchange_1011', 'if(p10>p11, density_10/mat1.def.eta(minput.T)*transmiss_10_11*(p10-p11), density_11/mat1.def.eta(minput.T)*transmiss_10_11*(p10-p11))');
model.component('comp3').variable.create('var2');
model.component('comp3').variable('var2').set('f1', '0.060026730');
model.component('comp3').variable('var2').set('f2', '0.050652859');
model.component('comp3').variable('var2').set('f3', '0.078822361');
model.component('comp3').variable('var2').set('f4', '0.084905932');
model.component('comp3').variable('var2').set('f5', '0.087882044');
model.component('comp3').variable('var2').set('f6', '0.092352129');
model.component('comp3').variable('var2').set('f7', '0.092676985');
model.component('comp3').variable('var2').set('f8', '0.096340938');
model.component('comp3').variable('var2').set('f9', '0.111042427');
model.component('comp3').variable('var2').set('f10', '0.114195366');
model.component('comp3').variable('var2').set('f11', '0.131102228');
model.component('comp3').variable('var2').set('transmiss_1_1', '3.099038E-07[m^3]');
model.component('comp3').variable('var2').set('transmiss_1_2', '1.928040E-14[m^3]');
model.component('comp3').variable('var2').set('transmiss_2_3', '6.243428E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_3_4', '4.056434E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_4_5', '3.212053E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_5_6', '2.622439E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_6_7', '2.156332E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_7_8', '1.747277E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_8_9', '1.269356E-15[m^3]');
model.component('comp3').variable('var2').set('transmiss_9_10', '7.259351E-16[m^3]');
model.component('comp3').variable('var2').set('transmiss_10_11', '2.380673E-16[m^3]');
model.component('comp3').variable('var2').selection.geom('geom3', 2);
model.component('comp3').variable('var2').selection.set([1]);
model.component('comp3').variable.create('var15');
model.component('comp3').variable('var15').set('element_size', '2[m]', 'element_size');
model.component('comp3').variable('var15').set('Vn', 'element_size^2*1[m]', 'needs to be corrected in 3d');
model.component('comp3').variable('var15').set('Vn1', 'f1*Vn');
model.component('comp3').variable('var15').set('Vn2', 'f2*Vn');
model.component('comp3').variable('var15').set('Vn3', 'f3*Vn');
model.component('comp3').variable('var15').set('Vn4', 'f4*Vn');
model.component('comp3').variable('var15').set('Vn5', 'f5*Vn');
model.component('comp3').variable('var15').set('Vn6', 'f6*Vn');
model.component('comp3').variable('var15').set('Vn7', 'f7*Vn');
model.component('comp3').variable('var15').set('Vn8', 'f8*Vn');
model.component('comp3').variable('var15').set('Vn9', 'f9*Vn');
model.component('comp3').variable('var15').set('Vn10', 'f10*Vn');
model.component('comp3').variable('var15').set('Vn11', 'f11*Vn');

model.component('comp3').view('view1').tag('view100');
model.view.create('view11', 2);
model.view.create('view12', 3);
model.view.create('view62', 3);
model.view.create('view63', 3);
model.view.create('view64', 2);

model.material.create('mat1', 'Common', '');
model.material.create('mat_minc1', 'Common', '');
model.material.create('mat_minc2', 'Common', '');
model.material.create('mat_minc3', 'Common', '');
model.material.create('mat_minc4', 'Common', '');
model.material.create('mat_minc5', 'Common', '');
model.material.create('mat_minc6', 'Common', '');
model.material.create('mat_minc7', 'Common', '');
model.material.create('mat_minc8', 'Common', '');
model.material.create('mat_minc9', 'Common', '');
model.material.create('mat_minc10', 'Common', '');
model.material.create('mat_minc11', 'Common', '');
model.material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('rho', 'Analytic');
model.material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.material('mat1').propertyGroup.create('idealGas', 'Ideal gas');
model.material('mat1').propertyGroup('idealGas').func.create('Cp', 'Piecewise');

model.component('comp3').coordSystem('sys1').tag('sys3');

model.component('comp3').physics.create('minc1', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc1').identifier('minc1');
model.component('comp3').physics('minc1').field('dimensionless').field('p1');
model.component('comp3').physics('minc1').field('dimensionless').component({'p1'});
model.component('comp3').physics('minc1').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics('minc1').create('constr1', 'PointwiseConstraint', 2);
model.component('comp3').physics('minc1').feature('constr1').selection.set([1]);
model.component('comp3').physics.create('minc2', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc2').identifier('minc2');
model.component('comp3').physics('minc2').field('dimensionless').field('p2');
model.component('comp3').physics('minc2').field('dimensionless').component({'p2'});
model.component('comp3').physics('minc2').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc3', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc3').identifier('minc3');
model.component('comp3').physics('minc3').field('dimensionless').field('p3');
model.component('comp3').physics('minc3').field('dimensionless').component({'p3'});
model.component('comp3').physics('minc3').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc4', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc4').identifier('minc4');
model.component('comp3').physics('minc4').field('dimensionless').field('p4');
model.component('comp3').physics('minc4').field('dimensionless').component({'p4'});
model.component('comp3').physics('minc4').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc5', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc5').identifier('minc5');
model.component('comp3').physics('minc5').field('dimensionless').field('p5');
model.component('comp3').physics('minc5').field('dimensionless').component({'p5'});
model.component('comp3').physics('minc5').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc6', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc6').identifier('minc6');
model.component('comp3').physics('minc6').field('dimensionless').field('p6');
model.component('comp3').physics('minc6').field('dimensionless').component({'p6'});
model.component('comp3').physics('minc6').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc7', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc7').identifier('minc7');
model.component('comp3').physics('minc7').field('dimensionless').field('p7');
model.component('comp3').physics('minc7').field('dimensionless').component({'p7'});
model.component('comp3').physics('minc7').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc8', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc8').identifier('minc8');
model.component('comp3').physics('minc8').field('dimensionless').field('p8');
model.component('comp3').physics('minc8').field('dimensionless').component({'p8'});
model.component('comp3').physics('minc8').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc9', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc9').identifier('minc9');
model.component('comp3').physics('minc9').field('dimensionless').field('p9');
model.component('comp3').physics('minc9').field('dimensionless').component({'p9'});
model.component('comp3').physics('minc9').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc10', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc10').identifier('minc10');
model.component('comp3').physics('minc10').field('dimensionless').field('p10');
model.component('comp3').physics('minc10').field('dimensionless').component({'p10'});
model.component('comp3').physics('minc10').prop('Units').set('DependentVariableQuantity', 'pressure');
model.component('comp3').physics.create('minc11', 'CoefficientFormPDE', 'geom3');
model.component('comp3').physics('minc11').identifier('minc11');
model.component('comp3').physics('minc11').field('dimensionless').field('p11');
model.component('comp3').physics('minc11').field('dimensionless').component({'p11'});
model.component('comp3').physics('minc11').prop('Units').set('DependentVariableQuantity', 'pressure');

model.component('comp3').mesh('mesh3').create('fq1', 'FreeQuad');

model.component('comp3').probe.create('bnd1', 'Boundary');
model.component('comp3').probe.create('dom1', 'Domain');
model.component('comp3').probe.create('dom2', 'Domain');
model.component('comp3').probe('bnd1').selection.set([]);

model.result.table('evl2').label('Evaluation 2D');
model.result.table('evl2').comments('Interactive 2D values');

model.component('comp3').variable('var1').label('Excgange Flow');
model.component('comp3').variable('var2').label('Left E-MINC variables f-Transm');
model.component('comp3').variable('var15').label('Element_size_Vn');

model.component('comp3').view('view100').label('View 65');
model.component('comp3').view('view100').axis.set('xmin', -0.16814151406288147);
model.component('comp3').view('view100').axis.set('xmax', 2.1681413650512695);
model.component('comp3').view('view100').axis.set('ymin', -0.061061907559633255);
model.component('comp3').view('view100').axis.set('ymax', 2.0610618591308594);
model.view('view64').axis.set('xmin', -1.2652344703674316);
model.view('view64').axis.set('xmax', 3.306295871734619);
model.view('view64').axis.set('ymin', -0.7170603275299072);
model.view('view64').axis.set('ymax', 3.6402411460876465);
model.view('view64').axis.set('viewscaletype', 'automatic');

model.material('mat1').label('Methane_Onur');
model.material('mat1').set('family', 'air');
model.material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('eta').set('pieces', {'100.0' '293.0' '-2.070784E-7+4.302773E-8*T^1-1.67479E-11*T^2'; '293.0' '1000.0' '-6.811519E-7+4.923719E-8*T^1-3.850654E-11*T^2+2.417259E-14*T^3-6.598298E-18*T^4'; '1000.0' '5000.0' '6.430947E-6+2.489517E-8*T^1-4.284466E-12*T^2+6.457607E-16*T^3-4.098145E-20*T^4'});
model.material('mat1').propertyGroup('def').func('eta').set('argunit', 'K');
model.material('mat1').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.material('mat1').propertyGroup('def').func('Cp').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('Cp').set('pieces', {'100.0' '200.0' '1705.94023+0.761864978*T^1-0.0065410815*T^2+1.89342234E-5*T^3'; '200.0' '1000.0' '1640.42339-3.13670882*T^1+0.0236579468*T^2-2.86547265E-5*T^3+1.1182171E-8*T^4'; '1000.0' '5500.0' '1653.94148+4.34360286*T^1-0.00154016011*T^2+2.46373543E-7*T^3-1.46520375E-11*T^4'});
model.material('mat1').propertyGroup('def').func('Cp').set('argunit', 'K');
model.material('mat1').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.material('mat1').propertyGroup('def').func('rho').set('expr', 'pA*0.016042/R_const[K*mol/J]/T');
model.material('mat1').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.material('mat1').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.016042/R_const/T,pA)'; 'T' 'd(pA*0.016042/R_const/T,T)'});
model.material('mat1').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.material('mat1').propertyGroup('def').func('rho').set('argunit', {'Pa' 'K'});
model.material('mat1').propertyGroup('def').func('rho').set('plotargs', {'pA' '101325' '101325'; 'T' '273.15' '293.15'});
model.material('mat1').propertyGroup('def').func('k').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('k').set('pieces', {'100.0' '120.0' '-0.001965865+1.202025E-4*T^1';  ...
'120.0' '200.0' '-0.00132094954+1.342773E-4*T^1-2.386183E-7*T^2+6.378542E-10*T^3';  ...
'200.0' '293.0' '0.00197021006+7.202431E-5*T^1+1.179385E-7*T^2';  ...
'293.0' '1000.0' '0.00417475838+4.51123E-5*T^1+2.234803E-7*T^2-1.467249E-10*T^3+4.215644E-14*T^4';  ...
'1000.0' '5000.0' '-0.0743229344+2.82463E-4*T^1-4.500648E-8*T^2+5.3444E-12*T^3-2.790872E-16*T^4'});
model.material('mat1').propertyGroup('def').func('k').set('argunit', 'K');
model.material('mat1').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.material('mat1').propertyGroup('def').set('ratioofspecificheat', '1.31');
model.material('mat1').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.material('mat1').propertyGroup('def').set('density', 'rho(pA,T)');
model.material('mat1').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.material('mat1').propertyGroup('def').addInput('temperature');
model.material('mat1').propertyGroup('def').addInput('pressure');
model.material('mat1').propertyGroup('idealGas').func('Cp').label('Piecewise 2');
model.material('mat1').propertyGroup('idealGas').func('Cp').set('arg', 'T');
model.material('mat1').propertyGroup('idealGas').func('Cp').set('pieces', {'100.0' '200.0' '1705.94023+0.761864978*T^1-0.0065410815*T^2+1.89342234E-5*T^3'; '200.0' '1000.0' '1640.42339-3.13670882*T^1+0.0236579468*T^2-2.86547265E-5*T^3+1.1182171E-8*T^4'; '1000.0' '5500.0' '1653.94148+4.34360286*T^1-0.00154016011*T^2+2.46373543E-7*T^3-1.46520375E-11*T^4'});
model.material('mat1').propertyGroup('idealGas').func('Cp').set('argunit', 'K');
model.material('mat1').propertyGroup('idealGas').func('Cp').set('fununit', 'J/(kg*K)');
model.material('mat1').propertyGroup('idealGas').set('Rs', 'R_const/Mn');
model.material('mat1').propertyGroup('idealGas').set('heatcapacity', 'Cp(T)');
model.material('mat1').propertyGroup('idealGas').set('ratioofspecificheat', '1.31');
model.material('mat1').propertyGroup('idealGas').set('molarmass', '0.016042');
model.material('mat1').propertyGroup('idealGas').addInput('temperature');
model.material('mat1').propertyGroup('idealGas').addInput('pressure');
model.material('mat1').materialType('nonSolid');
model.material('mat_minc1').label('Material 1');
model.material('mat_minc1').propertyGroup('def').set('porosity', '1');
model.material('mat_minc2').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc3').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc4').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc5').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc6').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc7').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc8').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc9').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc10').propertyGroup('def').set('porosity', '0.5');
model.material('mat_minc11').propertyGroup('def').set('porosity', '0.5');

model.component('comp3').coordSystem('sys3').label('Boundary System 3');
model.component('comp3').coordSystem('sys3').set('name', 'sys3');

model.component('comp3').physics('minc1').label('fracture');
model.component('comp3').physics('minc1').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc1').feature('cfeq1').set('c', {'p1/mat1.idealGas.Rs/minput.T*(transmiss_1_1/1[m])/mat1.def.eta(minput.T)' '0' '0' 'p1/mat1.idealGas.Rs/minput.T*(transmiss_1_1/1[m])/mat1.def.eta(minput.T)'});
model.component('comp3').physics('minc1').feature('cfeq1').set('f', '(-exchange_12)/Vn1*f1');
model.component('comp3').physics('minc1').feature('cfeq1').set('da', 'f1*mat_minc1.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc1').feature('init1').set('p1', 'p_initial');
model.component('comp3').physics('minc1').feature('constr1').set('constraintExpression', 'p1-p_fracture');
model.component('comp3').physics('minc2').label('Matrix1');
model.component('comp3').physics('minc2').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc2').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc2').feature('cfeq1').set('f', '(exchange_12-exchange_23)/Vn2*f2');
model.component('comp3').physics('minc2').feature('cfeq1').set('da', 'f2*mat_minc2.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc2').feature('init1').set('p2', 'p_initial');
model.component('comp3').physics('minc3').label('Matrix2');
model.component('comp3').physics('minc3').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc3').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc3').feature('cfeq1').set('f', '(exchange_23-exchange_34)/Vn3*f3');
model.component('comp3').physics('minc3').feature('cfeq1').set('da', 'f3*mat_minc3.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc3').feature('init1').set('p3', 'p_initial');
model.component('comp3').physics('minc4').label('Matrix3');
model.component('comp3').physics('minc4').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc4').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc4').feature('cfeq1').set('f', '(exchange_34-exchange_45)/Vn4*f4');
model.component('comp3').physics('minc4').feature('cfeq1').set('da', 'f4*mat_minc4.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc4').feature('init1').set('p4', 'p_initial');
model.component('comp3').physics('minc5').label('Matrix4');
model.component('comp3').physics('minc5').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc5').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc5').feature('cfeq1').set('f', '(exchange_45-exchange_56)/Vn5*f5');
model.component('comp3').physics('minc5').feature('cfeq1').set('da', 'f5*mat_minc5.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc5').feature('init1').set('p5', 'p_initial');
model.component('comp3').physics('minc6').label('Matrix5');
model.component('comp3').physics('minc6').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc6').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc6').feature('cfeq1').set('f', '(exchange_56-exchange_67)/Vn6*f6');
model.component('comp3').physics('minc6').feature('cfeq1').set('da', 'f6*mat_minc6.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc6').feature('init1').set('p6', 'p_initial');
model.component('comp3').physics('minc7').label('Matrix6');
model.component('comp3').physics('minc7').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc7').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc7').feature('cfeq1').set('f', '(exchange_67-exchange_78)/Vn7*f7');
model.component('comp3').physics('minc7').feature('cfeq1').set('da', 'f7*mat_minc7.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc7').feature('init1').set('p7', 'p_initial');
model.component('comp3').physics('minc8').label('Matrix7');
model.component('comp3').physics('minc8').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc8').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc8').feature('cfeq1').set('f', '(exchange_78-exchange_89)/Vn8*f8');
model.component('comp3').physics('minc8').feature('cfeq1').set('da', 'f8*mat_minc8.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc8').feature('init1').set('p8', 'p_initial');
model.component('comp3').physics('minc9').label('Matrix8');
model.component('comp3').physics('minc9').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc9').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc9').feature('cfeq1').set('f', '(exchange_89-exchange_910)/Vn9*f9');
model.component('comp3').physics('minc9').feature('cfeq1').set('da', 'f9*mat_minc9.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc9').feature('init1').set('p9', 'p_initial');
model.component('comp3').physics('minc10').label('Matrix9');
model.component('comp3').physics('minc10').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc10').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc10').feature('cfeq1').set('f', '(exchange_910-exchange_1011)/Vn10*f10');
model.component('comp3').physics('minc10').feature('cfeq1').set('da', 'f10*mat_minc10.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc10').feature('init1').set('p10', 'p_initial');
model.component('comp3').physics('minc11').label('Matrix10');
model.component('comp3').physics('minc11').prop('Units').set('CustomSourceTermUnit', 'kg/m^3/s');
model.component('comp3').physics('minc11').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp3').physics('minc11').feature('cfeq1').set('f', '(exchange_1011)/Vn11*f11');
model.component('comp3').physics('minc11').feature('cfeq1').set('da', 'f11*mat_minc11.def.epsilon/mat1.idealGas.Rs/minput.T');
model.component('comp3').physics('minc11').feature('init1').set('p11', 'p_initial');

model.component('comp3').mesh('mesh3').feature('size').set('custom', 'on');
model.component('comp3').mesh('mesh3').feature('size').set('hmax', 2);
model.component('comp3').mesh('mesh3').feature('size').set('hmin', 2);
model.component('comp3').mesh('mesh3').run;

model.component('comp3').probe('bnd1').active(false);
model.component('comp3').probe('bnd1').label('MINC11_Boundary_Flow');
model.component('comp3').probe('bnd1').set('type', 'integral');
model.component('comp3').probe('bnd1').set('probename', 'boundary_flow_Minc');
model.component('comp3').probe('bnd1').set('expr', 'dflux.p1');
model.component('comp3').probe('bnd1').set('unit', 'kg/(m*s)');
model.component('comp3').probe('bnd1').set('descr', 'Boundary flux down direction Boundary flux down direction');
model.component('comp3').probe('bnd1').set('window', 'window6');
model.component('comp3').probe('dom1').active(false);
model.component('comp3').probe('dom1').label(['MINC11_MASS_MATR' native2unicode(hex2dec({'01' '30'}), 'unicode') 'X']);
model.component('comp3').probe('dom1').set('type', 'integral');
model.component('comp3').probe('dom1').set('probename', 'Minc_Mass_Matrix');
model.component('comp3').probe('dom1').set('expr', 'f2*mat_minc2.def.epsilon/mat1.idealGas.Rs/minput.T*p2+f3*mat_minc3.def.epsilon/mat1.idealGas.Rs/minput.T*p3+f4*mat_minc4.def.epsilon/mat1.idealGas.Rs/minput.T*p4+f5*mat_minc5.def.epsilon/mat1.idealGas.Rs/minput.T*p5+f6*mat_minc6.def.epsilon/mat1.idealGas.Rs/minput.T*p6+f7*mat_minc7.def.epsilon/mat1.idealGas.Rs/minput.T*p7+f8*mat_minc8.def.epsilon/mat1.idealGas.Rs/minput.T*p8+f9*mat_minc9.def.epsilon/mat1.idealGas.Rs/minput.T*p9+f10*mat_minc10.def.epsilon/mat1.idealGas.Rs/minput.T*p10+f11*mat_minc11.def.epsilon/mat1.idealGas.Rs/minput.T*p11');
model.component('comp3').probe('dom1').set('unit', 'kg/m');
model.component('comp3').probe('dom1').set('descr', 'f2*mat_minc2.def.epsilon/mat1.idealGas.Rs/minput.T*p2+f3*mat_minc3.def.epsilon/mat1.idealGas.Rs/minput.T*p3+f4*mat_minc4.def.epsilon/mat1.idealGas.Rs/minput.T*p4+f5*mat_minc5.def.epsilon/mat1.idealGas.Rs/minput.T*p5+f6*mat_minc6.def.epsilon/mat1.idealGas.Rs/minput.T*p6+f7*mat_minc7.def.epsilon/mat1.idealGas.Rs/minput.T*p7+f8*mat_minc8.def.epsilon/mat1.idealGas.Rs/minput.T*p8+f9*mat_minc9.def.epsilon/mat1.idealGas.Rs/minput.T*p9+f10*mat_minc10.def.epsilon/mat1.idealGas.Rs/minput.T*p10+f11*mat_minc11.def.epsilon/mat1.idealGas.Rs/minput.T*p11');
model.component('comp3').probe('dom1').set('window', 'window6');
model.component('comp3').probe('dom2').active(false);
model.component('comp3').probe('dom2').label('MINC11_Mass_Fracture');
model.component('comp3').probe('dom2').set('type', 'integral');
model.component('comp3').probe('dom2').set('probename', 'MINC_Mass_Fracture');
model.component('comp3').probe('dom2').set('expr', 'f1*mat_minc1.def.epsilon/mat1.idealGas.Rs/minput.T*p1');
model.component('comp3').probe('dom2').set('unit', 'kg/m');
model.component('comp3').probe('dom2').set('descr', 'f1*mat_minc1.def.epsilon/mat1.idealGas.Rs/minput.T*p1');
model.component('comp3').probe('dom2').set('window', 'window6');

model.study.create('std3');
model.study('std3').create('time', 'Transient');

model.sol.create('sol3');
model.sol('sol3').study('std3');
model.sol('sol3').attach('std3');
model.sol('sol3').create('st1', 'StudyStep');
model.sol('sol3').create('v1', 'Variables');
model.sol('sol3').create('t1', 'Time');
model.sol('sol3').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol3').feature('t1').feature.remove('fcDef');

model.result.dataset.create('dset5', 'Solution');
model.result.dataset.remove('dset1');
model.result.create('pg2', 'PlotGroup2D');
model.result.create('pg4', 'PlotGroup1D');
model.result.create('pg5', 'PlotGroup1D');
model.result('pg2').create('surf1', 'Surface');
model.result('pg4').create('tblp2', 'Table');
model.result('pg5').create('tblp2', 'Table');

model.nodeGroup.create('grp3', 'GlobalDefinitions');
model.nodeGroup('grp3').set('type', 'material');
model.nodeGroup('grp3').placeAfter('material', 'mat1');

model.study('std3').label('MINC11');
model.study('std3').feature('time').set('tlist', 'range(0,10,100) range(100,100,4000) range(4000,1000, t_end)');

model.sol('sol3').attach('std3');
model.sol('sol3').feature('st1').label('Compile Equations: Time Dependent');
model.sol('sol3').feature('v1').label('Dependent Variables 1.1');
model.sol('sol3').feature('v1').set('clist', {'range(0,10,100) range(100,100,4000) range(4000,1000, t_end)' '0.001[s]'});
model.sol('sol3').feature('t1').label('Time-Dependent Solver 1.1');
model.sol('sol3').feature('t1').set('tlist', 'range(0,10,100) range(100,100,4000) range(4000,1000, t_end)');
model.sol('sol3').feature('t1').set('tstepsbdf', 'strict');
model.sol('sol3').feature('t1').set('initialstepbdfactive', true);
model.sol('sol3').feature('t1').set('maxstepconstraintbdf', 'const');
model.sol('sol3').feature('t1').set('maxstepbdf', 10000);
model.sol('sol3').feature('t1').feature('dDef').label('Direct 1');
model.sol('sol3').feature('t1').feature('aDef').label('Advanced 1');
model.sol('sol3').feature('t1').feature('fc1').label('Fully Coupled 1.1');
model.sol('sol3').runAll;

model.result.evaluationGroup('eg2').label('MINC11_Mass_Matrix');
model.result.evaluationGroup('eg2').set('data', 'dset5');
model.result.evaluationGroup('eg2').set('looplevelinput', {'all'});
model.result.evaluationGroup('eg2').feature('int2').label(['MINC11_MASS_MATR' native2unicode(hex2dec({'01' '30'}), 'unicode') 'X']);
model.result.evaluationGroup('eg2').feature('int2').set('expr', {'f2*mat_minc2.def.epsilon/mat1.idealGas.Rs/minput.T*p2+f3*mat_minc3.def.epsilon/mat1.idealGas.Rs/minput.T*p3+f4*mat_minc4.def.epsilon/mat1.idealGas.Rs/minput.T*p4+f5*mat_minc5.def.epsilon/mat1.idealGas.Rs/minput.T*p5+f6*mat_minc6.def.epsilon/mat1.idealGas.Rs/minput.T*p6+f7*mat_minc7.def.epsilon/mat1.idealGas.Rs/minput.T*p7+f8*mat_minc8.def.epsilon/mat1.idealGas.Rs/minput.T*p8+f9*mat_minc9.def.epsilon/mat1.idealGas.Rs/minput.T*p9+f10*mat_minc10.def.epsilon/mat1.idealGas.Rs/minput.T*p10+f11*mat_minc11.def.epsilon/mat1.idealGas.Rs/minput.T*p11'});
model.result.evaluationGroup('eg2').feature('int2').set('unit', {'kg/m'});
model.result.evaluationGroup('eg2').feature('int2').set('descr', {['MINC11_MASS_MATR' native2unicode(hex2dec({'01' '30'}), 'unicode') 'X']});
model.result.evaluationGroup('eg2').feature('int2').selection.set([1]);
model.result.evaluationGroup('eg3').label('MINC11_Mass_Fractue');
model.result.evaluationGroup('eg3').set('data', 'dset5');
model.result.evaluationGroup('eg3').set('looplevelinput', {'all'});
model.result.evaluationGroup('eg3').feature('int3').label('MINC11_Mass_Fracture');
model.result.evaluationGroup('eg3').feature('int3').set('expr', {'f1*mat_minc1.def.epsilon/mat1.idealGas.Rs/minput.T*p1'});
model.result.evaluationGroup('eg3').feature('int3').set('unit', {'kg/m'});
model.result.evaluationGroup('eg3').feature('int3').set('descr', {'MINC11_Mass_Fracture'});
model.result.evaluationGroup('eg3').feature('int3').selection.set([1]);
model.result.evaluationGroup('eg2').run;
model.result.evaluationGroup('eg3').run;
model.result('pg2').label('MINC');
model.result('pg2').set('looplevel', [1]);
model.result('pg2').feature('surf1').set('smooth', 'internal');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result('pg4').label('Mass Matrix');
model.result('pg4').set('data', 'none');
model.result('pg4').set('xlabel', 'Time (s)');
model.result('pg4').set('ylabel', 'Mass in matrix [kg]');
model.result('pg4').set('ylabelactive', true);
model.result('pg4').set('xlabelactive', false);
model.result('pg4').feature('tblp2').set('source', 'evaluationgroup');
model.result('pg4').feature('tblp2').set('preprocx', 'linear');
model.result('pg4').feature('tblp2').set('preprocy', 'linear');
model.result('pg4').feature('tblp2').set('linecolor', 'blue');
model.result('pg4').feature('tblp2').set('linewidth', 2);
model.result('pg4').feature('tblp2').set('legend', true);
model.result('pg4').feature('tblp2').set('legendmethod', 'manual');
model.result('pg4').feature('tblp2').set('legends', {'E-MINC 11'});
model.result('pg5').label('Mass Fracture');
model.result('pg5').set('data', 'none');
model.result('pg5').set('xlabel', 'Time (s)');
model.result('pg5').set('ylabel', 'MINC11_Mass_Fracture (kg/m)');
model.result('pg5').set('xlabelactive', false);
model.result('pg5').set('ylabelactive', false);
model.result('pg5').feature('tblp2').set('source', 'evaluationgroup');
model.result('pg5').feature('tblp2').set('evaluationgroup', 'eg3');
model.result('pg5').feature('tblp2').set('preprocx', 'linear');
model.result('pg5').feature('tblp2').set('preprocy', 'linear');
model.result('pg5').feature('tblp2').set('legend', true);

model.nodeGroup('grp3').label('MINC material');
model.nodeGroup('grp3').add('material', 'mat_minc1');
model.nodeGroup('grp3').add('material', 'mat_minc2');
model.nodeGroup('grp3').add('material', 'mat_minc3');
model.nodeGroup('grp3').add('material', 'mat_minc4');
model.nodeGroup('grp3').add('material', 'mat_minc5');
model.nodeGroup('grp3').add('material', 'mat_minc6');
model.nodeGroup('grp3').add('material', 'mat_minc7');
model.nodeGroup('grp3').add('material', 'mat_minc8');
model.nodeGroup('grp3').add('material', 'mat_minc9');
model.nodeGroup('grp3').add('material', 'mat_minc10');
model.nodeGroup('grp3').add('material', 'mat_minc11');

mphplot(model,'pg4','rangenum',1)
out = model;