// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.qwi.josemi.roo.domain;

import com.qwi.josemi.roo.domain.Login;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Login_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Login.entityManager;
    
    public static final EntityManager Login.entityManager() {
        EntityManager em = new Login().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Login.countLogins() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Login o", Long.class).getSingleResult();
    }
    
    public static List<Login> Login.findAllLogins() {
        return entityManager().createQuery("SELECT o FROM Login o", Login.class).getResultList();
    }
    
    public static Login Login.findLogin(Long id) {
        if (id == null) return null;
        return entityManager().find(Login.class, id);
    }
    
    public static List<Login> Login.findLoginEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Login o", Login.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Login.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Login.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Login attached = Login.findLogin(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Login.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Login.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Login Login.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Login merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}