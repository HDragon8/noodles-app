var c=(p,t,a)=>new Promise((n,o)=>{var r=e=>{try{s(a.next(e))}catch(_){o(_)}},d=e=>{try{s(a.throw(e))}catch(_){o(_)}},s=e=>e.done?n(e.value):Promise.resolve(e.value).then(r,d);s((a=a.apply(p,t)).next())});import{_ as i,d as u,I as l,o as x,c as g,b as m,J as v}from"./index.js?v=c1b13aa2";const f={id:"page",class:"page-top-container"},b=u({__name:"index",setup(p){const t=l();return(()=>c(this,null,function*(){yield t.getApp()}))(),(n,o)=>(x(),g("div",f,[m(v)]))}});var h=i(b,[["__scopeId","data-v-701aba0b"]]);export{h as default};
